module ObfuscateMy
  # The ObfuscateMy::CreditCard class represents a generic credic card.
  class AmericanExpress < ObfuscateMy::CreditCard
    def initialize(args)
      @type = :amex
      super
    end
    def valid_length?
      length == 15 ? true : false
    end

    def valid_number?
      !!(@number =~ /^3[47][0-9]{13}$/)
    end

    def valid_security_code?
      !!(@security_code =~ /^\d{4}$/)
    end

    def valid_type?
      :amex == @type.to_sym
    end

    def obfuscate_number
      # Test credit card number courtesy of PayPal
      # http://www.paypalobjects.com/en_US/vhelp/paypalmanager_help/credit_card_numbers.htm
      @number = '378282246310005'
    end

    def obfuscate_security_code
      @security_code = '0000'
    end
  end
end
