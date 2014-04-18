class ApplicationController < ActionController::Base
	protect_from_forgery

	helper :points, :accounts
	helper_method :log, :current_account, :credit?, :vote?,
		:logged?, :vip?, :admin?,
		:guest!, :logged!, :admin!

private	
	def log(type, infos = '')
		Log.log(request.remote_ip, current_account.try(:id), type, infos)
	end

	def logged?
		!!current_account
	end

	def vip?
		logged? && current_account.vip?
	end

	def admin?
		logged? && current_account.admin?
	end
	
	def guest!(url = root_url)
		redirect_to url, notice: t('require.level.guest') if logged?
	end

	def logged!(url = root_url)
		redirect_to url, notice: t('require.level.logged') unless logged?
	end
	
	def vip!(url = root_url)
		redirect_to url, notice: t('require.level.vip') unless admin?
	end

	def admin!(url = root_url)
		redirect_to url, notice: t('require.level.admin') unless admin?
	end

	def credit?
		return false unless APP_CONFIG['credit']
		APP_CONFIG['credit']['id'] && APP_CONFIG['credit']['points'] &&
		APP_CONFIG['credit']['type'] && (APP_CONFIG['credit']['type'] == 'star') #|| ...
	end

	def vote?
		return false unless APP_CONFIG['vote'].present?
		return false unless APP_CONFIG['vote']['id'] && APP_CONFIG['vote']['points']

		return true unless current_account
		# never voted 				   or last vote has been made more than 2hours ago
		current_account.last_vote.nil? || current_account.last_vote == 0 || Time.now - current_account.last_vote >= 2.hours
	end


	def current_account
		@current_account ||= Account.find(session[:account_id]) if session[:account_id].present?
	end
end
