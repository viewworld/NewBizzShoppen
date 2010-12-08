class Article < ActiveRecord::Base
  set_table_name 'articles'

  translates :title, :content

  validates_presence_of :title, :content, :scope, :on => :update

  include ScopedSearch::Model

  before_save :set_published_date

  scope :only_translations, lambda {|locale| includes(:translations).where(:article_translations => {:locale => locale.to_s})}
  scope :with_keyword, lambda { |q| only_translations(I18n.locale).where("lower(article_translations.title) LIKE :keyword OR lower(article_translations.content) LIKE :keyword", {:keyword => "%#{q.downcase}%"}) }
  scope :with_scope, lambda {|scope| where(["scope = ?", scope]) }
  scope :latest, order("created_at DESC")
  scope :published, where(:published => true)

  private

  def set_published_date
    if published_changed? and published?
      self.published_date = Time.now
    end
  end

  public

  def publish!
    update_attribute(:published, true)
  end

end
