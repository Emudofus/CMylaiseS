class SessionsController < ApplicationController
	before_filter :logged!, only: :destroy
	before_filter :guest!, only: [:create]

	def create
		if account = Account.authenticate(params[:login], params[:password])
			session[:account_id] = account.id
			redirect_to root_url, notice: t('successfully.logged_in')
		else
			redirect_to root_url, notice: t('failed.login')
		end
	end

	def destroy
		session[:account_id] = nil
		redirect_to root_url, notice: t('successfully.disconnected')
	end
end