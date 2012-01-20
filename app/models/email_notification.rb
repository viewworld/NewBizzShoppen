class EmailNotification

  def self.notify(subject, body)
    TemplateMailer.new("fairleads@selleo.com", :blank_template, Country.get_country_from_locale,
                                  {:subject_content => subject,
                                   :body_content => body}).deliver!

  end
end