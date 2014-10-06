class Domain < ActiveRecord::Base

  validates_presence_of :name, :site, :locale

  before_save :assure_default
  after_save :change_default

  scope :for_locale, lambda { |locale| where(:locale => locale.to_s) }
  scope :for_site, lambda { |site| where(:site => site.to_s) }
  scope :with_default, where(:default => true)

  def self.for_fairdeals
    for_site('fairdeals')
  end

  def self.for_site_and_locale(site,locale)
    Domain.where(:site => site, :locale => locale).first || Domain.where(:site => site).with_default.first
  end

  def self.default
    with_default.first.name_for_env
  end

  def name_for_env
    if Rails.env.development?
      "#{name}:3000"
    elsif Rails.env.staging?
      "#{site}.selleo.com"
    elsif Rails.env.production?
      "www.#{name}"
    else
      name
    end
  end

  private

  def assure_default
    if !default && default_changed? &&
      (Domain.for_locale(locale).for_site(site).with_default.size.eql?(1) &&
       Domain.for_locale(locale).for_site(site).with_default.first.eql?(self))
      self.errors.add(:default, :cannot_be_disabled)
      false
    end
  end

  def change_default
    if default? && default_changed?
      Domain.for_locale(locale).for_site(site).with_default.each do |domain|
        domain.update_attribute(:default, false) unless domain.eql?(self)
      end
    end
  end
end
