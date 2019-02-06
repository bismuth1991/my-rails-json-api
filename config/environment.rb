# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Camelize keys in jbuilder view for frontend
Jbuilder.key_format camelize: :lower
