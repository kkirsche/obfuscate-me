# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'obfuscate_my/version'

Gem::Specification.new do |spec|
  spec.name          = "obfuscate_my"
  spec.version       = ObfuscateMy::VERSION
  spec.authors       = ["Kevin Kirsche"]
  spec.email         = ["Kev.Kirsche@gmail.com"]

  spec.summary       = %q{Obfuscate My! is a project which allows you to parse your data and replace sensitive information with dummy data.}
  spec.description   = %q{Obfuscate My! is a project which allows you to parse your data and replace sensitive information with dummy data. Missing something? Let me know and if possible I'll add it to the gem! }
  spec.homepage      = "https://github.com/kkirsche/obfuscate-my"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.6"
end
