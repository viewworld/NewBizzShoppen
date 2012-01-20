class EmailNotification

  def self.notify(subject, body)
    TemplateMailer.delay(:queue => 'emails').new("fairleads@selleo.com", :blank_template, Country.get_country_from_locale,
                                  {:subject_content => subject,
                                   :body_content => body})

  end
end