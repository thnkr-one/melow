source "https://rubygems.org"

ruby file: ".ruby-version"

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

group :development, :test do
  gem "dotenv", ">= 3.0"
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "rack-mini-profiler"
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
