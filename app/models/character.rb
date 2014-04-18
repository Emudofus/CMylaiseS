class Character < ActiveRecord::Base
	self.table_name = "personnages"
	self.primary_key = 'guid'

	bad_attribute_names :class

	has_one :account, primary_key: :account, foreign_key: :guid

	def breed
		I18n.t('breed.' + self[:class].to_s)
	end

	def gender
		I18n.t('gender.' + sexe.to_s)
	end

	def icon_path
		"dofus/avatars/#{self[:class]}#{sexe}.jpg"
	end

	def add_prefix!(prefix)
		add_prefix(prefix)
		save if name_changed?
	end

	def remove_prefix!
		remove_prefix
		save if name_changed?
	end

private
	def add_prefix(prefix)
		self.name = "[#{prefix}]#{name}"
	end

	def remove_prefix
		if index = name.index(']')
			self.name = name[index+1..-1]
		end
	end
end
