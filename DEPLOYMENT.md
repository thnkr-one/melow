# Deployment

## Environment variables

These environment variables affect how the app functions when deployed in production.

- `RAILS_HOSTNAME` - Redirect all requests to the specified canonical hostname
- `RAILS_DISABLE_SSL` - Disable HSTS and secure cookies
- `RAILS_ENV` **REQUIRED** - "production" or "staging"
- `RAILS_MAX_THREADS` - Number of threads per Puma process (default: 3)
- `SECRET_KEY_BASE` **REQUIRED** - Unique, secret key used to encrypt and sign cookies and other sensitive data
- `WEB_CONCURRENCY` - Number of Puma processes (default: 1)
# PostgreSQL. Versions 9.3 and up are supported.
#
# Install the pg driver:
#   gem install pg
# On macOS with Homebrew:
#   gem install pg -- --with-pg-config=/usr/local/bin/pg_config
# On Windows:
#   gem install pg
#       Choose the win32 build.
#       Install PostgreSQL and put its /bin directory on your path.
#
# Configure Using Gemfile
# gem "pg"
#
default: &default
adapter: postgresql
encoding: unicode
# For details on connection pooling, see Rails configuration guide
# https://guides.rubyonrails.org/configuring.html#database-pooling
pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
<% if ENV["DB_HOST"] %>
host: <%= ENV["DB_HOST"] %>
username: postgres
password: postgres
<% end %>


development:
<<: *default
database: melow_development

# The specified database role being used to connect to PostgreSQL.
# To create additional roles in PostgreSQL see `$ createuser --help`.
# When left blank, PostgreSQL will use the default role. This is
# the same name as the operating system user running Rails.
#username: melow

# The password associated with the PostgreSQL role (username).
#password:

# Connect on a TCP socket. Omitted by default since the client uses a
# domain socket that doesn't need configuration. Windows does not have
# domain sockets, so uncomment these lines.
#host: localhost

# The TCP port the server listens on. Defaults to 5432.
# If your server runs on a different port number, change accordingly.
#port: 5432

# Schema search path. The server defaults to $user,public
#schema_search_path: myapp,sharedapp,public

# Minimum log levels, in increasing order:
#   debug5, debug4, debug3, debug2, debug1,
#   log, notice, warning, error, fatal, and panic
# Defaults to warning.
#min_messages: notice

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
# test:
<<: *default
database: melow_test

# As with config/credentials.yml, you never want to store sensitive information,
# like your database password, in your source code. If your source code is
# ever seen by anyone, they now have access to your database.
#
# Instead, provide the password or a full connection URL as an environment
# variable when you boot the app. For example:
#
#   DATABASE_URL="postgres://myuser:mypass@localhost/somedatabase"
#
# If the connection URL is provided in the special DATABASE_URL environment
# variable, Rails will automatically merge its configuration values on top of
# the values provided in this file. Alternatively, you can specify a connection
# URL environment variable explicitly:
#
#   production:
#     url: <%= ENV["MY_APP_DATABASE_URL"] %>
#
# Read https://guides.rubyonrails.org/configuring.html#configuring-a-database
# for a full overview on how database connection configuration can be specified.
#
production:
primary: &primary_production
<<: *default
database: melow_production
username: melow
password: <%= ENV["MELOW_DATABASE_PASSWORD"] %>
cache:
<<: *primary_production
database: melow_production_cache
migrations_paths: db/cache_migrate
queue:
<<: *primary_production
database: melow_production_queue
migrations_paths: db/queue_migrate
cable:
<<: *primary_production
database: melow_production_cable
migrations_paths: db/cable_migrate

staging:
primary: &primary_staging
<<: *default
database: melow_staging
username: melow
password: <%= ENV["MELOW_DATABASE_PASSWORD"] %>
cache:
<<: *primary_staging
database: melow_staging_cache
migrations_paths: db/cache_migrate
queue:
<<: *primary_staging
database: melow_staging_queue
migrations_paths: db/queue_migrate
cable:
<<: *primary_staging
database: melow_staging_cable
migrations_paths: db/cable_migrate