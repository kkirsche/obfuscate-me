require 'minitest_helper'

# Test CC numbers courtesy of PayPal
# http://www.paypalobjects.com/en_US/vhelp/paypalmanager_help/credit_card_numbers.htm

module TestObfuscateMy
  # The TestDownloader class below tests the Downloader class from the library
  class TestDiscover
    describe 'Discover', 'Represents an Discover credit card' do
      it 'should initialize and correctly assign values.' do
        discover = ObfuscateMy::Discover.new number: '6011111111111117',
                                     exp_year: 9999, exp_month: 01,
                                     name: 'Kevin Kirsche', security_code: '012'

        assert_kind_of ObfuscateMy::Discover, discover
        discover.type.must_equal :discover
        discover.cardholder_name.must_equal 'Kevin Kirsche'
        discover.number.must_equal '6011111111111117'
        discover.expiration_date.must_equal Time.new 9999, 01
        discover.security_code.must_equal '012'
      end

      it 'should raise an error when it incorrectly is instantiated.' do
        assert_raises RuntimeError do
          discover = ObfuscateMy::Discover.new number: '',
                                       exp_year: 9999, exp_month: 01,
                                       name: 'Kevin Kirsche', security_code: '0123'
        end
      end

      it 'should obfuscate values when requested' do
        discover = ObfuscateMy::Discover.new(number: '6011111111111117',
                                         exp_year: 9999, exp_month: 01,
                                         name: 'Kevin Kirsche', security_code: '012').
                                         obfuscate

        discover.type.must_equal :discover
        discover.cardholder_name.must_equal 'John Doe'
        discover.number.must_equal '6011000990139424'
        discover.expiration_date.must_equal Time.new(2015, 04, 13)
        discover.security_code.must_equal '000'
      end
    end
  end
end
