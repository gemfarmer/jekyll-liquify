# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "jekyll-liquify"
  spec.summary       = "A Jekyll filter that can parse Liquid in front matter."
  spec.version       = "0.0.2"
  spec.authors       = ["Brian Hedberg"]
  spec.email         = "briansheahedberg@gmail.com"
  spec.homepage      = "https://github.com/gemfarmer/jekyll-liquify"
  spec.licenses      = ["MIT"]

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "redcarpet", "~> 3.1"
  spec.add_runtime_dependency "liquid", [">= 2.5", "< 5.0"]

  spec.add_development_dependency "jekyll", [">= 2.0", "< 5.0"]
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "bundler", "~> 1.6"
end
