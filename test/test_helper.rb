# Add simplecov
require "minitest"
require "minitest/autorun"
require "minitest/reporters"
require "simplecov"

SimpleCov.start do
  add_filter 'test/'
end

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative '../lib/room'
require_relative '../lib/reservation'
# require_relative your lib files here!
