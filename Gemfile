# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.7.2'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'jbuilder', '~> 2.7'
gem 'pg'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'
gem 'slim-rails'
gem 'html2slim'
gem 'sorcery'
gem 'rails-i18n'
gem 'enum_help'
gem 'seed-fu'
gem 'draper'
gem 'gon'
gem 'dotenv-rails'
gem 'carrierwave'
gem 'mini_magick'
gem 'chartkick'
gem 'meta-tags'
gem 'toastr-rails'
gem 'slack-notifier'
gem 'exception_notification'
gem 'rack-user_agent'
gem 'kaminari'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot_rails'

  # Debugger
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'

  # rubocop
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubocop-performance', require: false
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
  gem 'foreman'
  gem "letter_opener_web"
  gem 'hirb'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :production do
  gem 'fog-aws'
end
