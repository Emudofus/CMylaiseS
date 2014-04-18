# string :title
# text :body
# references :account

class Article < ActiveRecord::Base
	belongs_to :account
	has_many :comments

	attr_accessible :title, :body

	def body
		super.force_encoding('utf-8')
	end
end
