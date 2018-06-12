source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'graphql', '~> 1.8.2'
gem 'pg', '~> 1.0.0'
gem 'puma', '~> 3.7'
gem 'rack-cors'
gem 'rails', '~> 5.1.6'

group :test do
  gem 'rspec', '~> 3.7.0', require: false
  gem 'rubocop', '~> 0.57.2', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
