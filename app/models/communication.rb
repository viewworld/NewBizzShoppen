class Communication < ActiveRecord::Base
  set_table_name "communications"

  scope :for_user, lambda { |user_ids| where("user_id IN (?)", user_ids) }
  scope :descending_by_created_at, order("created_at DESC")

  def related
    related_type.constantize.find_by_id(related_id)
  end

  def comment?
    communication_type == "Comment"
  end

  def archived_email?
    communication_type == "ArchivedEmail"
  end
end
