module Administration::EmailBouncesHelper
  def email_bounce_public_attributes
    [:subject, :message_id, :bounced_at]
  end

  def email_bounce_details_attributes
    [:inactive, :tag, :details, :postmark_id, :can_activate, :description, :type_code, :dump_available, :content]
  end
end
