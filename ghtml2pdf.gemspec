# frozen_string_literal: true

require_relative "lib/ghtml2pdf/version"

Gem::Specification.new do |spec|
  spec.name          = "ghtml2pdf"
  spec.version       = GHtml2Pdf::VERSION
  spec.authors       = ["Matijs van Zuijlen"]
  spec.email         = ["matijs@matijs.net"]

  spec.summary       = "HTML to PDF converter based on WebKit2GTK+"
  spec.description   = "Clean Ruby implemenentation of a HTML to PDF" \
                       " converter based on WebKit, WebKit2GTK+ and GirFFI"
  spec.homepage      = "https://github.com/mvz/ghtml2pdf"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 2.5.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mvz/ghtml2pdf"
  spec.metadata["changelog_uri"] = "https://github.com/mvz/ghtml2pdf/blob/master/Changelog.md"

  spec.files = File.read("Manifest.txt").split
  spec.bindir        = "bin"
  spec.executables   = ["ghtml2pdf"]
  spec.require_paths = ["lib"]

  spec.add_dependency "gir_ffi", "~> 0.15.2"
  spec.add_dependency "gir_ffi-gtk", "~> 0.15.0"
  spec.add_dependency "ruby-units", "~> 2.2"

  spec.add_development_dependency "aruba", "~> 2.0"
  spec.add_development_dependency "cucumber", "~> 6.0"
  spec.add_development_dependency "pdf-reader", "~> 2.5.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rake-manifest", "~> 0.2.0"
  spec.add_development_dependency "rspec", "~> 3.3"
  spec.add_development_dependency "rubocop", "~> 1.18.1"
  spec.add_development_dependency "rubocop-packaging", "~> 0.5.0"
  spec.add_development_dependency "rubocop-performance", "~> 1.11.0"
  spec.add_development_dependency "rubocop-rspec", "~> 2.4.0"
end
