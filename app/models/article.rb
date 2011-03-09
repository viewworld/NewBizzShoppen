class Article < ActiveRecord::Base
  set_table_name 'articles'

  attr_accessor :just_created

  translates :title, :content

  validates_presence_of :title, :content, :on => :update

  include ScopedSearch::Model

  scoped_order :id, :title, :created_at, :published_date, :views_count

  before_save :set_published_date
  after_create :set_just_created

  scope :only_translations, lambda {|locale| includes(:translations).where(:article_translations => {:locale => locale.to_s})}
  scope :with_keyword, lambda { |q| only_translations(I18n.locale).where("lower(article_translations.title) LIKE :keyword OR lower(article_translations.content) LIKE :keyword", {:keyword => "%#{q.downcase}%"}) }
  scope :latest, order("created_at DESC")
  scope :published, where(:published => true)
  scope :with_subclass, lambda { |s| where(["type LIKE ?","%#{s}%"])}
  scope :without_subclass, lambda { |s| where(["type NOT LIKE ?","%#{s}%"])}
  scope :ascend_by_title, only_translations(I18n.locale).order("article_translations.title ASC")
  scope :descend_by_title, only_translations(I18n.locale).order("article_translations.title DESC")
  scope :for_category, lambda { |category| where(:resource_type => 'Category', :resource_id => category.to_i) }

  private

  def set_published_date
    if published_changed? and published?
      self.published_date = Time.now
    elsif published_changed?
      self.published_date = nil
    end
  end

  def set_just_created
    self.just_created = true
  end

  public

  def publish!
    update_attribute(:published, true)
  end

end
