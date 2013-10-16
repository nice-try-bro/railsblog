module Web::Posts::CommentsHelper
  def nested_comments(comments)
    comments.map do |comment, sub_comments|
      content_tag(:div, render(:partial => 'web/posts/comments/comment',
        :object => comment), :class => "nested-comments")
    end.join.html_safe
  end
end
