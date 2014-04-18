class Account < ActiveRecord::Base
	has_many :articles
	has_many :logs
	#  has_many :comments

	attr_accessible :pseudo, :account, :pass, :pass_confirmation, :email, :question, :reponse

	validates :pass, confirmation: true
	validates :pseudo, :account, :pass, :email, :question, :reponse, presence: true

	has_many :characters, foreign_key: :account

	def vip?
		admin? || vip == '1'
	end

	def admin?
		level.to_i >= 4
	end

	def main_character
		@main_character ||= characters.find{|character|character.guid == main_char}
	end

	class << self
		def authenticate(account, pass)
			account = where(account: account).first
			if account && account.pass == pass
				account
			end
		end
	end
end