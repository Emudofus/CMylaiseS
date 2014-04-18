class LadderController < ApplicationController
	def characters
		@records = Character.includes{account}.where{account.level == 0}.order{xp.desc}
		setup_render
	end

	def guilds
		@records = Guild.order{xp.desc}
		setup_render
	end

	def votes
		@records = Account.order{count_vote.desc}
		setup_render
	end

	def setup_render
		@records = @records.page(params[:page]).per_page(20)
		@start = 1 + params[:page].to_i * 20
		render 'ladder'
	end
end