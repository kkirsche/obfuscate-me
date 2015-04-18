require 'minitest_helper'

# Test CC numbers courtesy of PayPal
# http://www.paypalobjects.com/en_US/vhelp/paypalmanager_help/credit_card_numbers.htm

module TestObfuscateMy
  # The TestDownloader class below tests the Downloader class from the library
  class TestAmericanExpress
    describe 'American Express', 'Represents an American Express credit card' do
      it 'should initialize and correctly assign values.' do
        amex = ObfuscateMy::AmericanExpress.new number: '371449635398431',
                                                exp_year: 9999, exp_month: 01,
                                                name: 'Kevin Kirsche', security_code: '0123'

        assert_kind_of ObfuscateMy::AmericanExpress, amex
        amex.type.must_equal :amex
        amex.cardholder_name.must_equal 'Kevin Kirsche'
        amex.number.must_equal '371449635398431'
        amex.expiration_date.must_equal Time.new 9999, 01
        amex.security_code.must_equal '0123'
      end

      it 'should raise an error when it incorrectly is instantiated.' do
        assert_raises RuntimeError do
          amex = ObfuscateMy::AmericanExpress.new number: '',
                                                  exp_year: 9999, exp_month: 01,
                                                  name: 'Kevin Kirsche', security_code: '0123'
        end
      end

      it 'should obfuscate values when requested' do
        amex = ObfuscateMy::AmericanExpress.new(number: '371449635398431',
                                                exp_year: 9999, exp_month: 01,
                                                name: 'Kevin Kirsche', security_code: '0123').
                                                obfuscate

        amex.type.must_equal :amex
        amex.cardholder_name.must_equal 'John Doe'
        amex.number.must_equal '378282246310005'
        amex.expiration_date.must_equal Time.new(2015, 04, 13)
        amex.security_code.must_equal '0000'
      end
    end
  end
end
