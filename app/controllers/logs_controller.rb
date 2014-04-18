class LogsController < ApplicationController
	before_filter :admin!

	def index
		if @account = Account.find(params[:account_id])
			@logs = @account.logs.page(params[:page]).per_page(20)
		else
			@logs = Log.where(account_id: nil)
		end
		
		if params[:type].present?
			@logs = @logs.where(type: params[:type])
		end
		if params[:ip] && params[:ip] != 'Ip'
			@logs = @logs.where{ip =~ "%#{my{params[:ip]}}%"}
		end
		@logs.all
	end
end