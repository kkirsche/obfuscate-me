require 'minitest_helper'

# Test CC numbers courtesy of PayPal
# http://www.paypalobjects.com/en_US/vhelp/paypalmanager_help/credit_card_numbers.htm

module TestObfuscateMy
  # The TestDownloader class below tests the Downloader class from the library
  class TestSocialSecurity
    describe 'Social Security Number', 'Represents a Social Security Number' do
      it 'should initialize and correctly assign values.' do
        ssn = ObfuscateMy::SocialSecurityNumber.new ssn: '012-34-5678'

        assert_kind_of ObfuscateMy::SocialSecurityNumber, ssn
        ssn.ssn.must_equal '012345678'
      end

      it 'Ensure that this is a valid SSN' do
        ssn = ObfuscateMy::SocialSecurityNumber.new ssn: '012-34-5678'

        assert_kind_of ObfuscateMy::SocialSecurityNumber, ssn
        ssn.ssn.eql?('012345678').must_equal true
      end
    end
  end
end
