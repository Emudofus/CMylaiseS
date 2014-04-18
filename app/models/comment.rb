# text :body
# references :account
# references :article

class Comment < ActiveRecord::Base
	belongs_to :account
	belongs_to :article

	attr_accessible :body
end
