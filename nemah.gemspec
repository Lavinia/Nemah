# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nemah/version'

Gem::Specification.new do |spec|
  spec.name          = 'nemah'
  spec.version       = Nemah::VERSION
  spec.authors       = ['Kim Persson', 'Lennart Fridén']
  spec.email         = ['forgetmenotox@notingham.se']
  spec.description   = 'Nemah is a library for calculating the proper amount of fodder for your horse.'
  spec.summary       = 'Horse fodder calculations library.'
  spec.homepage      = 'https://github.com/Lavinia/Nemah'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'byebug', '~> 2.5'
  spec.add_development_dependency 'guard', '~> 2.2'
  spec.add_development_dependency 'guard-rspec', '~> 4.2'
  spec.add_development_dependency 'rake', '~> 10.1'
  spec.add_development_dependency 'rspec', '~> 2.14'
end
