class VoucherNumber < ActiveRecord::Base
  belongs_to :deal
  belongs_to :user

  STATE_NEW = "new".freeze
  STATE_ACTIVE = "active".freeze
  STATE_USED = "used".freeze
  STATES = [STATE_NEW, STATE_ACTIVE, STATE_USED]

  validates_presence_of :number, :deal_id, :state
  validates_uniqueness_of :number, :scope => :deal_id
  validates_format_of :number, :with => /\A[A-Z\d]{9}\z/, :message => I18n.t("models.voucher_number.validates_format_of_number")
  validates_inclusion_of :state, :in => STATES

  scope :can_be_deleted, where("state = '#{STATE_NEW}'")
  scope :can_not_be_deleted, where("state <> '#{STATE_NEW}'")
  scope :find_active, lambda { |deal_unique_id, voucher_number| where("deal_unique_id = ? and number = ? and state = '#{STATE_ACTIVE}'", deal_unique_id, voucher_number) }
  scope :find_used, lambda { |deal_unique_id, voucher_number| where("deal_unique_id = ? and number = ? and state = '#{STATE_USED}'", deal_unique_id, voucher_number) }

  default_scope order("id")

  before_validation :on => :create do
    charset = (0..9).to_a + ("A".."Z").to_a
    self.number = (0...9).map { charset[rand(charset.size)] }.join
    self.deal_unique_id = self.deal.deal_unique_id
  end

  before_validation :on => :update do
    self.number = self.number.upcase
  end

  def translated_state
    I18n.t("models.voucher_number.states.#{state}")
  end

  def expired_date
    deal.voucher_until_type == 0 ? deal.voucher_end_date : (created_at + deal.voucher_number_of_weeks.weeks)
  end

  def to_pdf
    av = ActionView::Base.new
    av.view_paths << File.join(::Rails.root.to_s, "app", "views")
    av.instance_eval do
      extend ApplicationHelper
    end
    pdf_path = Rails.root.join "public/html2pdf/voucher_cache/voucher_#{deal_unique_id}_#{number}.pdf"
    html_path = Rails.root.join "public/html2pdf/voucher_cache/voucher_#{deal_unique_id}_#{number}.html"

    html = av.render(:partial => 'voucher_numbers/pdf', :type => :erb, :locals => {:voucher_number => self, :deal => self.deal})
    markup = File.read(Rails.root.join("app/views/layouts/pdf_voucher.html")) % html
    File.open(Rails.root.join(html_path), 'w') { |f| f.write(markup) }
    unless File.exists? pdf_path
      `python public/html2pdf/pisa.py #{html_path} #{pdf_path}`
      #File.delete(html_path)
    end
    html
  end

  class << self

    def validate_voucher(deal_id, voucher_number)
      if !find_active(deal_id, voucher_number).blank?
        [true, I18n.t("models.voucher_number.validate_voucher_result.valid")]
      elsif !find_used(deal_id, voucher_number).blank?
        [false, I18n.t("models.voucher_number.validate_voucher_result.already_used")]
      else
        [false, I18n.t("models.voucher_number.validate_voucher_result.invalid")]
      end
    end

    def use_voucher(deal_id, voucher_number)
      if validate_voucher(deal_id, voucher_number)[0]
        find_active(deal_id, voucher_number).first.update_attribute(:state, STATE_USED)
        [true, I18n.t("models.voucher_number.use_voucher_result.used")]
      else
        [false, I18n.t("models.voucher_number.use_voucher_result.error")]
      end
    end

  end

end