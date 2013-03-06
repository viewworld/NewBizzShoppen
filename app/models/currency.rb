class Currency < ActiveRecord::Base

  has_many :leads

  validates_presence_of :name, :symbol, :format
  validates_uniqueness_of :name

  before_destroy :can_be_destroyed?
  before_save :disable_global_default_if_not_active
  after_save :change_default_currency

  scope :active, where(:active => true)

#  private

  def can_be_destroyed?
    if leads.any?
      self.errors.add_to_base(I18n.t("administration.currencies.destroy.errors.has_leads"))
      false
    else
      true
    end
  end

  def change_default_currency
    if global_default? and global_default_changed? and active?
      Currency.where(:global_default => true).select { |c| c.id != id }.each do |currency|
        currency.update_attribute(:global_default, false)
      end
    end
  end

  def disable_global_default_if_not_active
    if !active? and global_default?
      self.global_default = false
    end
    true
  end

  public

  def to_euro(amount)
    if exchange_rate.to_f > 0
      (amount.to_f * (1.0 / exchange_rate.to_f)).round(2)
    else
      0
    end
  end

  def from_euro(amount)
    (amount.to_f * exchange_rate.to_f).round(2)
  end

  def to_s
    name
  end

  def self.default_currency
    Currency.where(:global_default => true).first
  end

  def self.euro
    Currency.where(:name => "EUR").first
  end

  def self.dkk
    Currency.where(:name => "DKK").first
  end
end
