# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'notebook-cat/version'

Gem::Specification.new do |spec|
  spec.name          = 'notebook-cat'
  spec.version       = NotebookCat::VERSION
  spec.authors       = ['Masayuki Higashino']
  spec.email         = ['msyk@hgsn.info']

  spec.summary       = 'A pretty notebook for cats.'
  spec.description   = 'A pretty notebook for cats.'
  spec.homepage      = 'https://github.com/mh61503891/notebook-cat'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'thor', '~> 0.19.4'
  spec.add_dependency 'redcarpet', '~> 3.4.0'
  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.6'
  spec.add_development_dependency 'pry', '~> 0.10.2'
  spec.add_development_dependency 'awesome_print', '~> 1.8.0'
end
