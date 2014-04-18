source 'https://rubygems.org'

gem 'rails', '3.2.9'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'

gem 'squeel'		  # AR improvement, ie Post.where{name == 'x' | (date > x & author ~= ..)}
gem 'will_paginate'	  # pagination
gem 'simple_form'	  # form dsl
gem 'haml-rails'	  # haml + haml generators
gem 'quiet_assets'	  # STFU ! stop logging assets
gem 'carrierwave'     # file uploading
gem 'turbolinks'	  # ajax
gem 'safe_attributes' # class & shit
gem 'rails-i18n'
#gem 'annotate'		# annotate models

group :development do
  # better exceptions
  gem 'better_errors'
  gem 'binding_of_caller', '0.7.2'
 gem 'meta_request' # rails-panel for chrome
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'livescript-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
 
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
gem 'jbuilder'

# Use unicorn as the app server
gem 'thin'
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'