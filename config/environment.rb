# Load the rails application
require File.expand_path('../application', __FILE__)

Encoding.default_internal, Encoding.default_external = ['utf-8'] * 2

# Initialize the rails application
Mpf::Application.initialize!
