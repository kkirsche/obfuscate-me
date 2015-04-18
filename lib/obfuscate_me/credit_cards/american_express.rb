module ObfuscateMe
  # The Obfuscateme::CreditCard class represents a generic credic card.
  class AmericanExpress < CreditCard
    def length?
      length == 15 ? true : false
    end

    def valid?
      !!(@number =~ /^3[47][0-9]{13}$/)
    end
  end
end
