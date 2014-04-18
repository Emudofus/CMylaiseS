# int :account_id
# string :ip
# string :type
# string :infos

class Log < ActiveRecord::Base
	class << self
		def log(ip, account, type, infos)
			record = self.create! ip: ip, account_id: account, type: type, infos: infos
			record.save
		end
	end
end