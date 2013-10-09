class StringUtils

  def self.replace(str, old_phrase, new_phrase)
    str.gsub(/(#{old_phrase})/i) { |s| "#{ s.to_s[0..0] =~ /[A-Z]/ ? new_phrase.capitalize : new_phrase.downcase }" }
  end

  def self.replace_template_variables(string)
    string.gsub(/(\{\{[\s\w.]+\}\})+/i) { |s| s.gsub('{{', '[').gsub('}}', ']').gsub(/[._]/, "-").gsub(/\s/, '') }
  end

  def self.replace_fairdeals_urls_for_auto_login_urls(user, body)
    body.gsub(/(http:\/\/\S+)"/) { |i | (i.to_s.include?("fairdeals.") and !i.to_s.include?("login_keys/")) ? %{http://#{URI.parse($1).host}/login_keys/?key=#{user.login_key}&redirect=#{CGI::escape($1)}"} : i }
  end

  def self.replace_urls_for_chain_mail_verification(chain_mail, body)
    body.gsub(/(https?:\/\/[\w.\-\/\?\=\&\:]*)/) do |uri|
      if !uri.to_s.include?("/chain_mails/#{chain_mail.id}") and !uri.to_s.include?("erhvervsanalyse.dk/s/")
        URI::HTTP.new('http', nil, Domain.default, nil, nil, "/chain_mails/#{chain_mail.id}", nil, "redirect=#{CGI::escape(uri)}", nil).to_s
      else
        uri
      end
    end
  end

  def self.replace_survey_fake_permalink_urls_with_recipients(body, recipient)
    body.gsub(/(https?:\/\/[\w.\-\/\?\=\&\:]*)/) do |uri|
      if uri.include?("http://erhvervsanalyse.dk/s/") and (survey = Survey.where(:uuid => uri.split("/").last).first) and (sr = survey.create_or_fetch_survey_recipient(recipient, false))
        sr.survey_link
      else
        uri
      end
    end
  end

  def self.clear_for_export(str)
    str.to_s.gsub(/[\n\r\t,]/, " ")
  end

end