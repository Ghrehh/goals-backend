# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'bcrypt', '~> 3.1.12'
gem 'graphql', '~> 1.8'
gem 'pg', '~> 1.0.0'
gem 'puma', '~> 3.7'
gem 'rack-cors'
gem 'rails', '~> 5.2.3'
gem 'newrelic_rpm', '~> 6.2.0'

group :development, :test do
  gem 'rspec-rails', '~> 3.8.2'
  gem "byebug", "~> 10.0"
end

group :test do
  gem 'rubocop', '~> 0.57.2', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
