class AccountsController < ApplicationController
	before_filter :guest!, only: [:new, :create]
	before_filter :admin!, only: :index

	def index
		@accounts = Account.page(params[:page]).per_page(10)
		if params[:q] && params[:q] != 'Account name'
			@accounts = @accounts.where{nickname =~ "%#{my{params[:q]}}%"}
		end
	end
	
	def show
		@account = Account.includes{characters}.find(params[:id])
	end
	
	def new
		@account = Account.new
	end
	
	def create
		@account = Account.new(params[:account])
		@account.last_vote = Time.now
		if @account.save
			session[:account_id] = @account.id
			redirect_to root_url, notice: t('successfully.created.account')
		else
			render action: 'new'
		end
	end
end