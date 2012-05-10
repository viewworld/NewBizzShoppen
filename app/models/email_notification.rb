class EmailNotification

  def self.notify(subject, body)
    TemplateMailer.new("tomasz.noworyta@gmail.com", :blank_template, Country.get_country_from_locale,
                                  {:subject_content => subject,
                                   :body_content => body}).deliver!

  end
end