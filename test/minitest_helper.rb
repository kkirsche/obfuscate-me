require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'obfuscate_my'
require 'minitest/autorun'

module TestObfuscateMy
end
