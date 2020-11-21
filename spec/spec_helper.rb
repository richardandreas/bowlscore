$LOAD_PATH << '../lib'

require 'simplecov'
require 'byebug'

SimpleCov.profiles.define 'tjce-profile' do
  add_filter '/spec/'
  add_filter '/version.rb'
  track_files "{lib}/**/*.rb"
end

SimpleCov.start 'tjce-profile'

# Require rspec covered files here
require 'bowlscore'
require 'file_parsers/bowlscore_file_parser'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.filter_run_excluding :skip => true

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end