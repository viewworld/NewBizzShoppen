class Comment < ActiveRecord::Base
  acts_as_nested_set :scope => [:commentable_id, :commentable_type]

  validates_presence_of :title, :body
  validates_presence_of :user
  
  # NOTE: install the acts_as_votable plugin if you 
  # want user to vote on the quality of comments.
  #acts_as_voteable
  
  # NOTE: Comments belong to a user
  belongs_to :user
  belongs_to :commentable, :polymorphic => true

  before_save :handle_blocking

  scope :descend_by_created_at, order("created_at DESC")
  scope :ascend_by_created_at, order("created_at ASC")
  scope :descend_by_header, joins("INNER JOIN leads ON leads.id = comments.commentable_id").order("leads.header DESC")
  scope :ascend_by_header, joins("INNER JOIN leads ON leads.id = comments.commentable_id").order("leads.header ASC")
  scope :descend_by_user, joins("INNER JOIN users ON users.id = comments.user_id").order("users.screen_name DESC")
  scope :ascend_by_user, joins("INNER JOIN users ON users.id = comments.user_id").order("users.screen_name ASC")
  scope :descend_by_last_thread_created_at, order("last_thread_created_at DESC")
  scope :ascend_by_last_thread_created_at, order("last_thread_created_at ASC")
  scope :with_keyword, lambda { |keyword| where("lower(leads.header) like :q", {:q => "%#{keyword.to_s.downcase}%"}) }
  scope :roots, where(:parent_id => nil)
  scope :for_leads, lambda {|leads| where(:commentable_type => 'AbstractLead', :commentable_id => leads.map(&:id))}
  scope :for_users, lambda {|users| where(:user_id => users.map(&:id))}
  scope :with_leads_created_by, lambda {|user| with_leads.where(:leads => {:creator_id => user.id})}
  scope :with_category, lambda { |category_id| category_id.blank? ? where("") : with_leads.where(:leads => { :category_id => Category.find_by_id(category_id).self_and_descendants.map(&:id) }) }
  scope :with_leads, joins("INNER JOIN leads ON leads.id = comments.commentable_id")

  # Helper class method that allows you to build a comment
  # by passing a commentable object, a user_id, and comment text
  # example in readme
  def self.build_from(obj, user_id, comment)
    c = self.new
    c.commentable_id = obj.id 
    c.commentable_type = obj.class.name 
    c.body = comment 
    c.user_id = user_id
    c
  end
  
  #helper method to check if a comment has children
  def has_children?
    self.children.size > 0 
  end
  
  # Helper class method to lookup all comments assigned
  # to all commentable types for a given user.
  scope :find_comments_by_user, lambda { |user|
    where(:user_id => user.id).order('created_at DESC')
  }

  # Helper class method to look up all comments for 
  # commentable class name and commentable id.
  scope :find_comments_for_commentable, lambda { |commentable_str, commentable_id|
    where(:commentable_type => commentable_str.to_s, :commentable_id => commentable_id).order('created_at DESC')
  }

  # Helper class method to look up a commentable object
  # given the commentable class name and id 
  def self.find_commentable(commentable_str, commentable_id)
    commentable_str.constantize.find(commentable_id)
  end

  def move_children_to_higher_parent
    if has_children?
      children.each do |child|
        if self.parent_id.present?
          child.move_to_child_of(parent_id)
        else
          child.move_to_root
        end
      end
    end
  end

  def assign_last_thread_created_at_to_root
    self.root.update_attribute(:last_thread_created_at, created_at)
  end
  
  def comment_to_insert_after
    siblings.where("is_blocked = ?", false).order("created_at").last || parent
  end

  def last_thread_created_at
    read_attribute(:last_thread_created_at).blank? ? created_at : read_attribute(:last_thread_created_at)
  end

  def handle_blocking
    if is_blocked_changed?
      children.each{ |child| child.update_attribute(:is_blocked, is_blocked?) }
    end
  end

  def can_be_shown_for?(_user)
    (parent.nil? or (parent and !parent.is_blocked)) and
    (_user.has_role?(:admin) or (_user.has_role?(:call_centre) and _user.subaccounts.include?(user))) or !is_blocked?
  end
end
