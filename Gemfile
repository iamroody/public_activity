ENV['PA_ORM'] ||= 'active_record'

source :rubygems


case ENV['PA_ORM']
when 'active_record'
  gem 'activerecord', '~> 3.0'
when 'mongoid'
  gem 'mongoid', '~> 3.0'
when 'mongo_mapper'
  gem 'mongo_mapper', '~> 0.12.0'
  gem 'bson_ext'
end

group :development, :test do
  gem 'sqlite3', '~> 1.3.7' if ENV['PA_ORM'] == 'active_record'
  gem 'mocha', '~> 0.13.0', require: false
  gem 'simplecov', '~> 0.7.0'
  gem 'minitest', '>= 4.3.0'
  gem 'redcarpet'
  gem 'yard', '~> 0.8'
end

gemspec
