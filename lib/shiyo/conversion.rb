# frozen_string_literal: true

module Shiyo
  # The module to provide conversion methods.
  module Conversion
    # rubocop:disable Naming/MethodName

    # Ensures the object to be a Shiyo compatible object.
    # @param object Any object.
    # @raise [Shiyo::ConversionError]
    def Specification(object)
      check_compatibility_of(object)
    end
    # rubocop:enable Naming/MethodName

    module_function

    # A private method used by `#Specification()`.
    # @!visibility private
    def check_compatibility_of(object)
      object.to_shiyo
    rescue NoMethodError => e
      raise Shiyo::Error::IncompatibleObject, <<~MESSAGE
        #{e.message}
        Can't convert #{object} into Shiyo compatible object.
        The class of the object must include `Shiyo::Specification`,
          or have `#to_shiyo()` for compatibility.
      MESSAGE
    end
  end
end
