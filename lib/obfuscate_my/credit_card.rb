module ObfuscateMy
  # The ObfuscateMy::CreditCard class represents a generic credic card.
  class CreditCard
    attr_reader :type, :number, :expiration_date,
                :cardholder_name, :security_code

    def initialize(args)
      @number = args[:number].gsub(/[^0-9]+/, '')
      @expiration_date = Time.new(args[:exp_year], args[:exp_month])
      @cardholder_name = args[:name]
      @security_code = args[:security_code]

      fail 'Invalid credit card configuration' unless valid?
    end

    def length
      @number.length
    end

    def valid?
      valid_expiration? && valid_number? && valid_name? &&
        valid_length? && valid_security_code? && valid_type?
    end

    def valid_expiration?
      @expiration_date > Time.now
    end

    def valid_name?
      !@cardholder_name.nil?
    end

    def obfuscate
      obfuscate_name && obfuscate_number && obfuscate_expiration &&
        obfuscate_security_code
      self
    end

    def obfuscate_name(sex = :male)
      sex == :male ? @cardholder_name = 'John Doe' : @cardholder_name = 'Jane Doe'
    end

    def obfuscate_expiration
      @expiration_date = Time.new(2015, 04, 13) # Release date of Ruby 2.2.2
    end
  end
end
