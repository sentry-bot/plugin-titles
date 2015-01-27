# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "sentry-title"
  spec.version       = File.new("VERSION", 'r').read.chomp
  spec.authors       = ["jRiddick"]
  spec.email         = ["apersson.93@gmail.com"]
  spec.summary       = %q{Parses HTML-titles and outputs them to the channel}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "nokogiri"
  spec.add_dependency "cinch"
  spec.add_dependency "open_uri_redirections"
end
