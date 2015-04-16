module ObfuscateMe
  # The Obfuscateme::SocialSecurityNumber represents a social security number.
  class SocialSecurityNumber
    alias_method :eql?, :with_dashes_eql?
    attr_reader :ssn

    def initialize(ssn)
      @ssn = ssn
      setup_regex

      self
    end

    def setup_regex
      @with_dashes_ssn_regex = /\d{3}-\d{2}-\d{4}/
      @without_dashes_ssn_regex = /\d{9}/

      true
    end

    # Expects type string
    def with_dashes_eql?(other)
      @ssn == @with_dashes_ssn_regex.match(other)
    end

    # Expects type string
    def without_dashes_eql?(other)
      @ssn == @without_dashes_ssn_regex.match(other)
    end
  end
end
