# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ghtml2pdf/version"

Gem::Specification.new do |spec|
  spec.name          = "ghtml2pdf"
  spec.version       = GHtml2Pdf::VERSION
  spec.authors       = ["Matijs van Zuijlen"]
  spec.email         = ["matijs@matijs.net"]

  spec.summary       = "HTML to PDF converter based on WebKit2GTK+"
  spec.description   = '
    Clean Ruby implemenentation of a HTML to PDF
    converter based on WebKit, WebKit2GTK+ and GirFFI
  '
  spec.required_ruby_version = ">= 2.4.0"
  spec.homepage      = "https://github.com/mvz/ghtml2pdf"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb",
                           "Changelog.md",
                           "LICENSE.txt",
                           "README.md"]
  spec.bindir        = "bin"
  spec.executables   = ["ghtml2pdf"]
  spec.require_paths = ["lib"]

  spec.add_dependency "gir_ffi", "~> 0.15.2"
  spec.add_dependency "gir_ffi-gtk", "~> 0.15.0"
  spec.add_dependency "ruby-units", "~> 2.2"

  spec.add_development_dependency "aruba", "~> 1.0.0"
  spec.add_development_dependency "cucumber", "~> 4.0"
  spec.add_development_dependency "pdf-reader", "~> 2.4.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.3"
end
