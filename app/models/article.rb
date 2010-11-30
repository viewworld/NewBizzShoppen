class Article < ActiveRecord::Base
  set_table_name 'articles'

  translates :title, :content

  validates_presence_of :title, :content, :scope

  include ScopedSearch::Model

  scope :with_keyword, lambda { |q| where("lower(title) LIKE :keyword OR lower(content) LIKE :keyword", {:keyword => "%#{q.downcase}%"}) }
  scope :with_scope, lambda {|scope| where(["scope = ?", scope]) }

end
