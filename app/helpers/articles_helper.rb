module ArticlesHelper
	def article_link(article)
		link = link_to_unless_current(article.title, article)
		link << "\n"

		if admin?
			link << link_to('[X]', article, method: :delete, style: 'color: red;')
		end

		link
	end
end
