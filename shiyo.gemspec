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
    It provides the base class and some utility classes to build composite specifications by method chaining.
  DESCRIPTION
  spec.homepage = "https://github.com/johnny-miyake/shiyo"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

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

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
