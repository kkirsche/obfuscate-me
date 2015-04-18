require 'minitest_helper'

# Test CC numbers courtesy of PayPal
# http://www.paypalobjects.com/en_US/vhelp/paypalmanager_help/credit_card_numbers.htm

module TestObfuscateMy
  # The TestDownloader class below tests the Downloader class from the library
  class TestVisa
    describe 'Visa', 'Represents an Visa credit card' do
      it 'should initialize and correctly assign values.' do
        visa = ObfuscateMy::Visa.new number: '4012888888881881',
                                     exp_year: 9999, exp_month: 01,
                                     name: 'Kevin Kirsche', security_code: '012'

        assert_kind_of ObfuscateMy::Visa, visa
        visa.type.must_equal :visa
        visa.cardholder_name.must_equal 'Kevin Kirsche'
        visa.number.must_equal '4012888888881881'
        visa.expiration_date.must_equal Time.new 9999, 01
        visa.security_code.must_equal '012'
      end

      it 'should initialize and correctly assign values for older 13 digit cards.' do
        visa = ObfuscateMy::Visa.new number: '4222222222222',
                                     exp_year: 9999, exp_month: 01,
                                     name: 'Kevin Kirsche', security_code: '012'

        assert_kind_of ObfuscateMy::Visa, visa
        visa.type.must_equal :visa
        visa.cardholder_name.must_equal 'Kevin Kirsche'
        visa.number.must_equal '4222222222222'
        visa.expiration_date.must_equal Time.new 9999, 01
        visa.security_code.must_equal '012'
      end

      it 'should raise an error when it incorrectly is instantiated.' do
        assert_raises RuntimeError do
          visa = ObfuscateMy::Visa.new number: '',
                                       exp_year: 9999, exp_month: 01,
                                       name: 'Kevin Kirsche', security_code: '0123'
        end
      end

      it 'should obfuscate values when requested' do
        visa = ObfuscateMy::Visa.new(number: '4111111111111111',
                                     exp_year: 9999, exp_month: 01,
                                     name: 'Kevin Kirsche', security_code: '012').
                                     obfuscate

        visa.type.must_equal :visa
        visa.cardholder_name.must_equal 'John Doe'
        visa.number.must_equal '4012888888881881'
        visa.expiration_date.must_equal Time.new(2015, 04, 13)
        visa.security_code.must_equal '000'
      end
    end
  end
end
