module Web::Posts::CommentsHelper
  def nested_comments(comments)
    comments_tree = comments.arrange(:order => :created_at)
    comments_tree.map do |comment, _|
      content_tag(:div, render(:partial => 'web/posts/comments/comment',
        :object => comment), :class => "nested-comments")
    end.join.html_safe
  end
end
