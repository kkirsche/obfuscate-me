module ObfuscateMe
  # The Obfuscateme::CreditCard class represents a generic credic card.
  class CreditCard
    attr_reader :cc_number

    def initialize(cc_num, type = :visa)
      @cc_number = cc_num
      @type = type
    end

    def setup_regex
      @with_dashes_ssn_regex = /\d{3}-\d{2}-\d{4}/
      @without_dashes_ssn_regex = /\d{9}/

      true
    end
  end
end
