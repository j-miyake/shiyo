# frozen_string_literal: true

module Shiyo
  # The mixin module that provides basic methods to implement user specifications.
  module Specification
    # Composes a Spec::And specification of self and the other specification.
    #
    # @param other [Shiyo::Specification] A specification object to combine with self.
    # @return [Shiyo::And] The composed specification.
    def and(other)
      Shiyo::And.new(self, other)
    end

    # Composes a Spec::Or specification of self and the other specification.
    #
    # @param other [Shiyo::Specification] A specification object to combine with self.
    # @return [Shiyo::Or] The composed specification.
    def or(other)
      Shiyo::Or.new(self, other)
    end

    # Inspects whether the candidate satisfies the the specification.
    # This method must be overridden by the class that includes this module.
    #
    # @param candidate [Object] The candidate object to be inspected.
    # @return [void]
    # @raise [NotImplementedError]
    def satisfied_by?(_candidate)
      raise NotImplementedError, "Implement your inspection code."
    end

    def to_shiyo
      self
    end
  end
end
