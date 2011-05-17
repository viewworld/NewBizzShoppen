class Currency < ActiveRecord::Base

  has_many :leads

  validates_presence_of :name, :symbol, :format
  validates_uniqueness_of :name

  before_destroy :can_be_destroyed?

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

  public

  def to_euro(amount)
    if exchange_rate.to_f > 0
      amount * (1.0 / exchange_rate)
    else
      0
    end
  end

  def to_s
    name
  end

end
