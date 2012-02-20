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
end