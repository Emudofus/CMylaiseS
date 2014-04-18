json.(article, :id, :title, :created_at)

if article.account
	json.author article.account, :id, :pseudo
end