# frozen_string_literal: true

module Shiyo
  module Error
    class ShiyoError < StandardError; end

    class IncompatibleObject < ShiyoError; end
  end
end
