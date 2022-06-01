# frozen_string_literal: true

require_relative "lib/shiyo/version"

Gem::Specification.new do |spec|
  spec.name = "shiyo"
  spec.version = Shiyo::VERSION
  spec.authors = ["Takuma Miyake"]
  spec.email = ["j.e.miyake@gmail.com"]

  spec.summary = "A minimal framework for the Specification pattern."
  spec.description = <<-DESCRIPTION
    Shiyo is a minimal framework that supports writing your business rules using the Specification pattern.
  DESCRIPTION
  spec.homepage = "https://github.com/j-miyake/shiyo"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/j-miyake/shiyo"
  spec.metadata["changelog_uri"] = "https://github.com/j-miyake/shiyo/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
