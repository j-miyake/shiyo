# frozen_string_literal: true

require_relative "shiyo/error"
require_relative "shiyo/version"
require_relative "shiyo/conversion"
require_relative "shiyo/syntax_sugar"
require_relative "shiyo/specification"
require_relative "shiyo/and"
require_relative "shiyo/or"
require_relative "shiyo/not"

# The top module of Shiyo
module Shiyo
  extend Shiyo::Conversion
  extend Shiyo::SyntaxSugar
end
