# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "sentry-titles"
  spec.version       = File.new("VERSION", 'r').read.chomp
  spec.authors       = ["jRiddick"]
  spec.email         = ["apersson.93@gmail.com"]
  spec.summary       = %q{Parses HTML-titles and outputs them to the channel}
  spec.homepage      = "https://rubygems.org/gems/sentry-titles"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "nokogiri", "~> 1.6"
  spec.add_dependency "cinch", "~> 2.0"
  spec.add_dependency "open_uri_redirections", "~> 0.2"
  spec.add_dependency "twitter-text", "~> 1.13"
end
