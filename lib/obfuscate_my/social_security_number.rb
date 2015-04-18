module ObfuscateMy
  # The ObfuscateMy::SocialSecurityNumber represents a social security number.
  class SocialSecurityNumber
    attr_reader :ssn

    def initialize(arg)
      @ssn = arg[:ssn].gsub(/\-/, '')

      self
    end

    def eql?(other)
      !!(other =~ /\d{9}/)
    end
  end
end
