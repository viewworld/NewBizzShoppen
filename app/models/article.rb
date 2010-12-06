class Article < ActiveRecord::Base
  set_table_name 'articles'

  translates :title, :content

  validates_presence_of :title, :content, :scope, :on => :update

  include ScopedSearch::Model

  before_save :set_published_date

  scope :with_keyword, lambda { |q| where("lower(title) LIKE :keyword OR lower(content) LIKE :keyword", {:keyword => "%#{q.downcase}%"}) }
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

end
