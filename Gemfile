# frozen_string_literal: true

ruby '2.7.1'
source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

group :development, :test do
  gem 'rspec', '~> 3.10'
  gem 'ruby-debug-ide'
  gem 'solargraph'
  platform :ruby do
    gem 'debase'
  end
  platform :jruby do
    gem 'ruby-debug-base'
  end
end

group :test do
  gem 'webmock'
end

gem "rspec-parameterized", "~> 0.5.0"
