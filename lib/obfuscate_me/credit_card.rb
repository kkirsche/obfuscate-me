require 'obfuscate_me/credit_cards/american_express'

module ObfuscateMe
  # The Obfuscateme::CreditCard class represents a generic credic card.
  class CreditCard
    attr_reader :type, :number, :expiration_date,
                :cardholder_name, :security_code
    def initialize(args)
      @type = args[:type]
      @number = args[:number].gsub(/[^0-9]+/, '')
      @expiration_date = args[:exp_date]
      @cardholder_name = args[:name]
      @security_code = args[:security_code]
    end

    def length
      @number.length
    end
  end
end
