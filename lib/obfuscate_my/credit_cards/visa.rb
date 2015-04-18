module ObfuscateMy
  # The ObfuscateMy::CreditCard class represents a generic credic card.
  class Visa < ObfuscateMy::CreditCard
    def initialize(args)
      @type = :visa
      super
    end

    def valid_length?
      (length == 13 || length == 16) ? true : false
    end

    def valid_number?
      # Credit card regexes courtesy of
      # http://www.regular-expressions.info/creditcard.html
      !!(@number =~ /^4[0-9]{12}(?:[0-9]{3})?$/)
    end

    def valid_security_code?
      !!(@security_code =~ /^\d{3}$/)
    end

    def valid_type?
      :visa == @type.to_sym
    end

    def obfuscate_number
      # Test credit card number courtesy of PayPal
      # http://www.paypalobjects.com/en_US/vhelp/paypalmanager_help/credit_card_numbers.htm
      @number = '4012888888881881'
    end

    def obfuscate_security_code
      @security_code = '000'
    end
  end
end
