module CommentsHelper

  def number_of_comments(num)
    "#{num} #{num == 1 ? t('comments.shared.comment') : t('comments.shared.comments')}".html_safe
  end

end