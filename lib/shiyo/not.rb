# frozen_string_literal: true

module Shiyo
  # The class to create a wrapper specification for checking
  # whether the candidate does not satisfy the wrapped specification.
  class Not
    include Shiyo::Specification
    # A new instance of Shiyo::Not
    #
    # @param wrapped [Shiyo::Specification] A specification object.
    def initialize(wrapped)
      @wrapped = Shiyo::Specification(wrapped)
    end

    # Inspects whether the candidate does not satisfy the wrapped specification.
    #
    # @param candidate [Object] The candidate object to be inspected.
    # @return [Boolean] The result.
    def satisfied_by?(candidate)
      !@wrapped.satisfied_by?(candidate)
    end
  end
end
