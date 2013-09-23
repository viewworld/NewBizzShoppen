module Mail
  class Postmark

    def deliver!(mail)
      ::Postmark.api_key = settings[:api_key]

      archived_email = ArchivedEmail.new

      [:subject, :to, :bcc, :cc, :reply_to, :email_template_uniq_id, :sender_id, :related_id, :related_type].each do |header_name|
        value = mail.header[header_name].present? ? mail.header[header_name].value : nil
        archived_email.send("#{header_name}=".to_sym, value)
      end

      [:email_template_uniq_id, :sender_id, :related_id, :related_type].each do |header_name|
        mail.header[header_name] = nil
      end

      archived_email.body = mail.body.raw_source if mail.body
      archived_email.save

      if response = ::Postmark.send_through_postmark(mail)
        archived_email.update_attributes(:message_id => response["MessageID"], :error_code => response["ErrorCode"], :status => ArchivedEmail::SENT)
      else
        archived_email.update_attributes(:status => ArchivedEmail::NOT_SENT)
      end
    end

  end
end