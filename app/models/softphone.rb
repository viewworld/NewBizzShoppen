class Softphone < ActiveRecord::Base
  belongs_to :user
  belongs_to :softphone_server

  scope :custom, where('user_id IS NOT NULL')
  scope :shared, where(:user_id => nil)
  scope :available, lambda { |user| where('user_id IS NULL OR user_id = ?', user) }

  validates :name, :presence => true, :if => lambda { is_a?(Softphone) ? validates_name? : true }
  validates :name, :uniqueness => { :scope => :user_id }

  def copy_attributes
    attributes.reject {|attr,_| !%w(sip_username sip_password softphone_server_id).include?(attr)}
  end

  def shared?
    user_id.nil?
  end

  private

  def validates_name?
    fields = [sip_username, sip_password, softphone_server_id]
    fields.any?(&:present?) || new_record? && name.blank? && user_id.blank?
  end
end
