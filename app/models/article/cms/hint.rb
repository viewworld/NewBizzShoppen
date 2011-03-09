class ::Article::Cms::Hint < ::Article::Cms
   validates_presence_of :key

  def content_sanitized
    content.gsub(/\n/,"").gsub(/\r/,"").gsub(/[']/, '\\\\\'')
  end
end