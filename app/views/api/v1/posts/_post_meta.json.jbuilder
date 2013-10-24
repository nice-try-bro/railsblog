if post.author
  json.has_author true
  json.author_id post.author.id
  json.author_login post.author.login
  json.author_name post.author.name
else
  json.has_author false
end
json.id post.id
json.title post.title
json.state post.state
json.comments_count post.comments.count
