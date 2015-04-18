require 'minitest_helper'

# Test CC numbers courtesy of PayPal
# http://www.paypalobjects.com/en_US/vhelp/paypalmanager_help/credit_card_numbers.htm

module TestObfuscateMy
  # The TestDownloader class below tests the Downloader class from the library
  class TestVisa
    describe 'MasterCard', 'Represents an MasterCard credit card' do
      it 'should initialize and correctly assign values.' do
        mastercard = ObfuscateMy::MasterCard.new number: '5555555555554444',
                                                 exp_year: 9999, exp_month: 01,
                                                 name: 'Kevin Kirsche', security_code: '012'

        assert_kind_of ObfuscateMy::MasterCard, mastercard
        mastercard.type.must_equal :mastercard
        mastercard.cardholder_name.must_equal 'Kevin Kirsche'
        mastercard.number.must_equal '5555555555554444'
        mastercard.expiration_date.must_equal Time.new 9999, 01
        mastercard.security_code.must_equal '012'
      end

      it 'should raise an error when it incorrectly is instantiated.' do
        assert_raises RuntimeError do
          mastercard = ObfuscateMy::MasterCard.new number: '',
                                                   exp_year: 9999, exp_month: 01,
                                                   name: 'Kevin Kirsche', security_code: '0123'
        end
      end

      it 'should obfuscate values when requested' do
        mastercard = ObfuscateMy::MasterCard.new(number: '5555555555554444',
                                                 exp_year: 9999, exp_month: 01,
                                                 name: 'Kevin Kirsche', security_code: '012').
                                                 obfuscate

        mastercard.type.must_equal :mastercard
        mastercard.cardholder_name.must_equal 'John Doe'
        mastercard.number.must_equal '5105105105105100'
        mastercard.expiration_date.must_equal Time.new(2015, 04, 13)
        mastercard.security_code.must_equal '000'
      end
    end
  end
end
