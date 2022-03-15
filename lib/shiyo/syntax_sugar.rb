# frozen_string_literal: true

module Shiyo
  # The module to provide syntax sugars.
  module SyntaxSugar
    # rubocop:disable Naming/MethodName

    # The syntax sugar for `Shiyo::Not.new`
    # @param object Any object.
    # @return [Shiyo::Not]
    def Not(object)
      Shiyo::Not.new(object)
    end
    # rubocop:enable Naming/MethodName
  end
end
