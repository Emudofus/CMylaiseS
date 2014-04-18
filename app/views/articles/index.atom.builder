atom_feed do |feed|
	feed.title APP_CONFIG['title']
	feed.updated @articles.maximum(:updated_at)
	
	@articles.each do |article|
		feed.entry article do |entry|
			entry.title article.title
			entry.content article.body
			entry.author do |author|
				author.name article.account.nickname
			end
		end
	end
end