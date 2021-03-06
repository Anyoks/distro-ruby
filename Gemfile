source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.8'
    # deploy
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
  gem 'capistrano-passenger'
end

group :test do 
  gem 'factory_bot', '~> 5.0'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'faker'
  gem 'database_cleaner'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'graphiql-rails', '1.5.0'
  # to enable vscode ruby extensions
  gem 'solargraph'
  
  # gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

gem 'devise' # user authentication
gem 'devise-jwt' # useing jwt with devise
# to enable cross origin resource sharing
gem 'rack-cors', :require => 'rack/cors'
gem 'annotate', '~> 2.7', '>= 2.7.2'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# authentication for the API
gem 'devise_token_auth'
gem 'devise-token_authenticatable', '~> 1.1.0'
gem 'omniauth'

#graphQl 
# gem 'graphql', '1.8.3'
gem 'graphql', '1.9.3'
# for grouping data by data
gem 'groupdate'
# static routing
gem 'rails-static-router'
# Uploading pictures
gem 'carrierwave', '~> 2.0'
# file apload on graphql
gem 'apollo_upload_server', '2.0.0.beta.3'
# multitenancy
gem 'apartment', '~> 2.2', '>= 2.2.1'
# using rubocop for code formating
gem 'rubocop'