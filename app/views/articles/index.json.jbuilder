json.array!(@articles) do |json, article|
  json.partial! article
end

# Examples directly taken from RailsCasts#320 "jBuilder"

# json.edit_url edit_article_url(@article) if current_user.admin?

# json.author @article.author, :id, :name
# or 
# json.author do |json|
  # json.(@article.author, :id, :name)
  # json.url author_url(@article.author)
# end

# json.comments @article.comments, :id, :name, :content
# or
# json.comments @article.comments do |json, comment|
  # json.partial! comment
# end