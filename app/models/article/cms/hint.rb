class ::Article::Cms::Hint < ::Article::Cms
  validates :key, presence: true

  def content_sanitized
    content.gsub(/\n|\r/,'').gsub(/[']/, '\\\\\'')
  end
end
