# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ghtml2pdf/version'

Gem::Specification.new do |spec|
  spec.name          = 'ghtml2pdf'
  spec.version       = GHtml2Pdf::VERSION
  spec.authors       = ['Matijs van Zuijlen']
  spec.email         = ['matijs@matijs.net']

  spec.summary       = 'HTML to PDF converter based on WebKit2GTK+'
  spec.description   = '
    Clean Ruby implemenentation of a HTML to PDF
    converter based on WebKit, WebKit2GTK+ and GirFFI
  '
  spec.homepage      = 'https://github.com/mvz/ghtml2pdf'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.bindir        = 'bin'
  spec.executables   = ['ghtml2pdf']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.3'
  spec.add_development_dependency 'cucumber', '~> 2.1'
  spec.add_development_dependency 'aruba', '~> 0.9.0'
end
