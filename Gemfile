source "https://rubygems.org"

ruby '3.3.4'

gem "rack-canonical-host"
gem "rails", github: "rails/rails", branch: "main"
gem "propshaft"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "bootsnap", require: false
gem "kamal", require: false
gem "thruster", require: false
gem 'bcrypt'
#gem 'calypso', git: 'git@github.com:thnkr-one/calypso.git'
gem 'httparty'
gem 'good_job'
gem 'rails-settings-cached'

gem 'faraday'
gem 'faraday-multipart'
# gem 'envo', git: 'git@github.com:thnkr-one/envo.git'
gem "lucide-rails", github: "maybe-finance/lucide-rails"
gem "image_processing", ">= 1.2"
gem "faraday-retry"
gem "inline_svg"
gem "octokit"
gem "csv"
gem "redcarpet"

group :development, :test do
  gem "dotenv", ">= 3.0"
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem 'faker'
  gem 'yaml_db'
  gem 'hotwire-livereload'
end

group :development do
  gem "rack-mini-profiler"
  gem 'stackprof'
  gem "letter_opener"
  gem "annotate"
  gem "web-console"
end

group :test do
  gem "webmock"
  gem "vcr"
  gem "shoulda-matchers"
  gem "shoulda-context"
  gem "mocha"
  gem "capybara", require: false
  gem "selenium-webdriver", require: false
end

gem "pagy", "~> 9.0"

gem "dockerfile-rails", ">= 1.6", :group => :development

gem "redis", "~> 5.3"

gem "aws-sdk-s3", "~> 1.167", :require => false
