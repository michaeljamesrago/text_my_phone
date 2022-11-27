# Load the Rails application.
require_relative "application"

if ENV['RAILS_ENV'] == 'development'
  env = File.join(Rails.root, 'config', 'env.rb')
  load(env) if File.exist?(env)
end

# Initialize the Rails application.
Rails.application.initialize!
