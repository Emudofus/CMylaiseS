# string :image

class Screen < ActiveRecord::Base
	attr_accessible :image

	mount_uploader :image, ScreenUploader
end