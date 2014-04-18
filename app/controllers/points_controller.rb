class PointsController < ApplicationController
	before_filter :logged!, :credit!, only: [:code, :credit]

	def code
	end

	def credit
		redirect_to root_path unless credit?
	
		if code_correct?(params[:code1])
			log 'credit', params[:code1]

			current_account.points += APP_CONFIG['credit'][points_key]
			current_account.count_credit += 1
			current_account.save! validate: false #account may be invalid
		else
			flash.now.alert = t('failed.credit')
			render 'code'
		end
	end

	def vote
		if logged? && !vote?
			redirect_to root_path
			return
		end

		if logged?
			current_account.points += APP_CONFIG['vote'][points_key]
			current_account.last_vote = Time.now
			current_account.count_vote += 1
			current_account.save! validate: false

			log 'vote'
		end
		
		redirect_to "http://www.rpg-paradize.com/?page=vote&vote=#{APP_CONFIG['vote']['id']}"
	end
	
	private
		helper_method :points_key
		def points_key
			if current_account.vip?
				"points_vip"
			else
				"points"
			end
		end

		def credit!
			redirect_to root_path unless credit?
		end

		def code_correct?(code)
			method = :"#{APP_CONFIG['credit']['type']}_code_correct?"
			send(method, code)
		end
		
		def star_code_correct?(code)
			result = nil
			open("http://script.starpass.fr/check_php.php?ident=#{params['idp']};;#{APP_CONFIG['credit']['id']}&codes=#{code}") do |f|
				result = f.each.first[0,3] == 'OUI'
			end
			result
		end
end