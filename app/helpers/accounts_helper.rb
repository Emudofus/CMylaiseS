module AccountsHelper
	def logged_count
		@logged_count ||= Account.where{logged==1}.count
	end
end
