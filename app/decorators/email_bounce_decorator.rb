class EmailBounceDecorator < ApplicationDecorator
  def sender_email
    object.sender ? object.sender.email : t("administration.email_bounces.index.view.anonymous")
  end

  def sent_at
    l(object.sent? ? object.bounced_at : object.created_at)
  end
end
