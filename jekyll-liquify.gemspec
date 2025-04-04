# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'jekyll-liquify'
  spec.summary       = 'A Jekyll filter that can parse Liquid in front matter.'
  spec.version       = '0.1.0'
  spec.authors       = ['Brian Hedberg']
  spec.email         = 'briansheahedberg@gmail.com'
  spec.homepage      = 'https://github.com/gemfarmer/jekyll-liquify'
  spec.licenses      = ['MIT']

  spec.required_ruby_version = '>= 3'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'base64'
  spec.add_dependency 'csv'
  spec.add_dependency 'liquid'
  spec.add_dependency 'logger'
  spec.add_dependency 'redcarpet'

  spec.metadata['rubygems_mfa_required'] = 'true'
end
