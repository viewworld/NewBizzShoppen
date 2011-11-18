class StringUtils

  def self.replace(str, old_phrase, new_phrase)
    str.gsub(/(#{old_phrase})/i) { |s| "#{ s.to_s[0..0] =~ /[A-Z]/ ? new_phrase.capitalize : new_phrase.downcase }" }
  end

  def self.replace_template_variables(string)
    string.gsub(/(\{\{[\s\w.]+\}\})+/i) { |s| s.gsub('{{', '[').gsub('}}', ']').gsub(/[._]/, "-").gsub(/\s/, '') }
  end
end