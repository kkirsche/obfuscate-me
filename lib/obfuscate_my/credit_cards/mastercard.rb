module ObfuscateMy
  # The ObfuscateMy::CreditCard class represents a generic credic card.
  class MasterCard < ObfuscateMy::CreditCard
    def initialize(args)
      @type = :mastercard
      super
    end

    def valid_length?
      length == 16 ? true : false
    end

    def valid_number?
      # Credit card regexes courtesy of
      # http://www.regular-expressions.info/creditcard.html
      !!(@number =~ /^5[1-5][0-9]{14}$/)
    end

    def valid_security_code?
      !!(@security_code =~ /^\d{3}$/)
    end

    def valid_type?
      :mastercard == @type.to_sym
    end

    def obfuscate_number
      # Test credit card number courtesy of PayPal
      # http://www.paypalobjects.com/en_US/vhelp/paypalmanager_help/credit_card_numbers.htm
      @number = '5105105105105100'
    end

    def obfuscate_security_code
      @security_code = '000'
    end
  end
end
