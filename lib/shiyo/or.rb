# frozen_string_literal: true

module Shiyo
  # The class to create a composite specification for checking
  # whether the candidate satisfies any of the two specifications.
  class Or
    include Shiyo::Specification
    # A new instance of Shiyo::Or
    #
    # @param one [Shiyo::Specification] A specification object.
    # @param other [Shiyo::Specification] The other specification object.
    def initialize(one, other)
      @one = Shiyo::Specification(one)
      @other = Shiyo::Specification(other)
    end

    # Inspects whether the candidate satisfies any of the wrapped specifications.
    #
    # @param candidate [Object] The candidate object to be inspected.
    # @return [Boolean] The result.
    def satisfied_by?(candidate)
      @one.satisfied_by?(candidate) || @other.satisfied_by?(candidate)
    end
  end
end
