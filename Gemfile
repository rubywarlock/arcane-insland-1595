source 'https://rubygems.org'
ruby '2.1.2'
gem 'rails', '4.0.1'
gem 'thin'

gem 'sass-rails', '~> 4.0.1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

gem 'jquery-rails'
#gem 'jquery-fileupload-rails'

gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
#gem 'bootstrap-sass', '~> 3.0.2.1'
gem 'bootstrap-sass', '~> 2.3.2.0'
gem 'bcrypt-ruby', '3.1.2'

gem 'will_paginate', '3.0.4'
gem 'bootstrap-will_paginate', '0.0.9'
gem 'breadcrumbs_on_rails'

gem 'tinymce-rails', '~> 4'
#gem 'bootstrap-wysihtml5-rails', '~> 0.3.1.24'

gem 'paperclip', '~> 4'#:git => 'git://github.com/thoughtbot/paperclip.git'

gem 'russian', '~> 0.6.0'

group :doc do
	# bundle exec rake doc:rails generates the API under doc/api.
	gem 'sdoc', require: false
end

group :production do
	#gem 'sqlite3', '~> 1.3.9'
	gem 'execjs'
	gem 'therubyracer'
	gem 'pg'
	gem 'rails_12factor', '0.0.2'
	#gem 'capybara', '2.1.0'
	gem 'thread_safe', '0.3.1'
end

group :development, :test do
	gem 'rspec-rails', '2.13.1'
	gem 'capybara', '2.1.0'

	#gem 'guard-rspec', '2.5.0'
	#gem 'spork-rails', '4.0.0'
	#gem 'guard-spork', '1.5.0'
	#gem 'childprocess', '0.3.6'
	#gem 'mysql'
  gem 'sqlite3', '~> 1.3.9'
end

group :test do
	gem 'selenium-webdriver', '2.35.1'
	gem 'capybara', '2.1.0'
	gem 'factory_girl_rails', '4.3.0'
end