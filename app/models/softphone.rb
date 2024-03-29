class Softphone < ActiveRecord::Base
  belongs_to :user
  belongs_to :softphone_server

  scope :custom, where('user_id IS NOT NULL')
  scope :shared, where(:user_id => nil)
  scope :available, lambda { |user| where('user_id IS NULL OR user_id = ?', user) }

  validates :name, :uniqueness => { :scope => :user_id }

  def copy_attributes
    attributes.reject {|attr,_| !%w(sip_username sip_password softphone_server_id).include?(attr)}
  end

  def shared?
    user_id.nil?
  end
end
