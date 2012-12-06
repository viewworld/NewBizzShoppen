class LeadPurchase < LeadPurchaseBase
  unless ['production', 'test'].include?(Rails.env)
    LeadPrimaryPurchase
    LeadAdditionalBuyout
  else
    require 'lead_primary_purchase'
    require 'lead_additional_buyout'
  end

  belongs_to :assignee, :class_name => "User::LeadUser", :foreign_key => "assignee_id"
  belongs_to :purchaser, :class_name => "User::LeadSupplier", :foreign_key => "purchased_by"
  belongs_to :lead, :counter_cache => :lead_purchases_counter
  has_one :invoice_line, :as => :payable

  before_save :assign_to_proper_owner_if_accessible
  before_save :change_contacted_state
  before_save :handle_new_deadline
  before_save :set_assigned_at
  before_create :set_euro_price
  after_save :deliver_lead_rated_as_unsatisfactory_email
  after_save :deliver_about_to_expire_email
  before_create :assign_to_purchaser
  after_save :deliver_bought_notification
  after_create :refresh_lead_category

  liquid :id, :header, :description, :hidden_description, :company_name, :contact_name, :contact_title, :email_address, :direct_phone_number,
         :phone_number, :address, :rating_level_as_text, :rating_reason, :url

  private

  def refresh_lead_category
    [:refresh_leads_count_cache!, :refresh_published_leads_count_cache!].each do |method|
      lead.category.send(method)
    end
  end

  def assign_to_proper_owner_if_accessible
    if (u = User.find(owner_id)) && u.parent
      if (new_record? && !accessible_from.nil?) || (accessible_from_changed? && !accessible_from.nil?)
        self.owner_id = u.parent_id
      end
    end
  end

  def assign_to_purchaser
    self.assignee_id = purchased_by if purchased_by
  end

  def change_contacted_state
    if state_changed? and state_was == NOT_CONTACTED
      self.contacted = CONTACTED
      self.expiration_status = ACTIVE
    end
  end

  def handle_new_deadline
    if response_deadline_changed? and !response_deadline.nil? and contacted == NOT_CONTACTED
      self.expiration_status = if (response_deadline-Date.today).to_i < 0
                                 EXPIRED
                               elsif (0..2).include?((response_deadline-Date.today).to_i)
                                 ABOUT_TO_EXPIRE
                               else
                                 ACTIVE
                               end
    end
  end

  def deliver_about_to_expire_email
    if expiration_status_changed? and expiration_status == ABOUT_TO_EXPIRE and contacted == NOT_CONTACTED
      deliver_email_template("lead_purchase_is_about_to_expire")
    end
  end

  def deliver_lead_rated_as_unsatisfactory_email
    if rating_level_changed? and !rating_level.nil? and rating_level >= RATING_MISSING_CONTACT_INFO
      self.lead.update_attributes(:notify_suppliers_after_update => false, :has_unsatisfactory_rating => true)
      deliver_email_template("lead_rated_as_unsatisfactory", lead.creator.email)
    end
  end

  def deliver_bought_notification
    if accessible_from_changed? and !accessible_from.nil? and !owner.disable_bought_notification
      if lead.category.email_template.blank?
        deliver_email_template("bought_lead_notification", owner.email)
      else
        TemplateMailer.new(owner.email, lead.category.email_template, Country.get_country_from_locale, {:lead_purchase => self, :sender_id => nil}).deliver!
      end
    end
  end

  def set_assigned_at
    if !assignee_id.blank? and assignee_id_changed?
      self.assigned_at = Time.now
    end
  end

  def paid!
    self.paid = true
    self.accessible_from = Time.now
    save
  end

  def set_euro_price
    self.euro_price = lead.currency.to_euro(lead.price)
  end

  public

  class << self

    def to_csv(*ids)
      FasterCSV.generate(:force_quotes => true) do |csv|
        lead_purchases = find(ids)
        templates = lead_purchases.map { |lp| lp.lead.lead_templates }.flatten.uniq
        template_fields = templates.map { |t| t.lead_template_fields }.flatten
        csv << LeadPurchaseBase::CSV_ATTRS.map(&:humanize) + template_fields.map(&:name)
        lead_purchases.each { |lp| csv << LeadPurchaseBase::CSV_ATTRS.map { |attr| lp.lead[attr].to_s.gsub("\n", " ") } + template_fields.map { |tf| tf.value_for_lead(lp.lead).to_s.gsub("\n", " ") } }
      end
    end

  end

  def to_csv
    LeadPurchase.to_csv(id)
  end

  def deliver_email_template(uniq_id, to=nil)
    TemplateMailer.new(to.blank? ? owner.email : to, uniq_id.to_sym, Country.get_country_from_locale, {:lead_purchase => self, :sender_id => nil}).deliver!
  end

  def about_to_expire!
    update_attribute(:expiration_status, ABOUT_TO_EXPIRE)
  end

  def expire!
    update_attribute(:expiration_status, EXPIRED)
  end

  def expiring?
    expiration_status == ABOUT_TO_EXPIRE and contacted == NOT_CONTACTED
  end

  def expired?
    expiration_status == EXPIRED
  end

  def rating_level_as_text
    I18n.t("activerecord.attributes.lead_purchase.rating_levels.rating_level#{rating_level}")
  end

  def rating_as_percentage
    if rating_level == RATING_EXCELLENT
      1
    elsif rating_level == RATING_VERY_GOOD
      0.5
    elsif rating_level == RATING_SATISFACTORY
      0.25
    elsif (RATING_MISSING_CONTACT_INFO..RATING_OTHER_REASON).include?(rating_level)
      0
    else
      -1
    end
  end

  def is_rated_as_unsatisfactory?
    UNSATISFACTORY_RATING_LEVELS.include?(rating_level)
  end

  def total
    quantity * lead.price
  end

  def url
    "http://#{Nbs::Application.config.action_mailer.default_url_options[:host]}/suppliers/lead_purchases/#{id}"
  end

end
