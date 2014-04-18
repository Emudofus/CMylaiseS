class ProfileController < ApplicationController
	before_filter :logged!
	before_filter :vip, only: :main_char

	def vip
		redirect_to root_url if vip?
	end

	def become_vip
		if vip?
			redirect_to root_url
			return
		end

		if current_account.points >= APP_CONFIG['vip']['cost']
			current_account.vip = '1'
			current_account.points -= APP_CONFIG['vip']['cost']
			current_account.save validate: false

			redirect_to root_url
		else
			redirect_to vip_path
		end
	end

	def main_char
		character_id = params[:character].to_i
		if !character_id || current_account.main_char == character_id
			redirect_to root_url, notice: "invalid"
			return
		end

		if current_main_character = current_account.main_character
			current_main_character.title = 0
			current_main_character.remove_prefix!
		end

		unless main_character = current_account.characters.find{|c| c.guid == character_id}
			redirect_to root_url, notice: "character not found"
			return
		end

		current_account.main_char = character_id
		current_account.save
		if APP_CONFIG['vip']['title']
			main_character.title = APP_CONFIG['vip']['title']
		end
		main_character.add_prefix! "VIP"

		redirect_to current_account
	end
end
