lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'custom_translations/version'

Gem::Specification.new do |spec|
  spec.name          = 'custom_translations'
  spec.version       = CustomTranslations::VERSION
  spec.authors       = ['Zakharov Ivan']
  spec.email         = ['chronoiicross@gmail.com']
  spec.summary       = 'I18n locales overriding via single file.'
  spec.description   = 'I18n locales overriding via single file.'
  spec.homepage      = 'https://github.com/drMinami/custom_translations'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '~> 4'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3'
  spec.add_development_dependency 'simplecov'
end
