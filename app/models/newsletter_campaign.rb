class NewsletterCampaign < ActiveRecord::Base
  has_and_belongs_to_many :newsletter_lists

  before_create :generate_template_key
  after_save :create_template_hash_id
  before_validation :set_name
  validates_presence_of :cm_username, :cm_password, :unless => Proc.new{|n| n.skip_validations}

  SAVED_AS_DRAFT = 0.freeze
  SENT_TO_CM = 1.freeze
  STATUSES = [SAVED_AS_DRAFT, SENT_TO_CM]

  include CommonNewsletter

  private

  def set_name
    self.name = "FDNL #{Time.now.strftime("%d-%m-%Y %H:%M:%S")}"
  end

  def create_template_hash_id

  end

  def generate_template_key
    self.template_key = Digest::SHA1.hexdigest("#{created_at} -- #{id} -- #{Time.now}") unless template_key
    template_key
  end
end
