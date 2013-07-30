class EmailTemplateSignature < ActiveRecord::Base

  belongs_to :related, :polymorphic => true
  has_many :chain_mail_types
  translates :body

  scope :custom, where("related_type IS NULL and related_id IS NULL")

  validates_presence_of :name, :if => Proc.new { |ets| ets.related.nil? }
  validates_uniqueness_of :name, :if => Proc.new { |ets| ets.related.nil? }

  before_destroy :can_be_destroyed

  FROM_EMAILS = %w{admin@fairleads.com admin@fairdeals.dk admin@erhvervsanalyse.dk}

  private

  def can_be_destroyed
    related.present? or (related.nil? and chain_mail_types.empty?)
  end
end
