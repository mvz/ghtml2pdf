# frozen_string_literal: true

require 'ghtml2pdf/version'
require 'ghtml2pdf/application'

# Main entry point for GHtml2Pdf.
module GHtml2Pdf
  # Run the application.
  #
  # @param [Array] argv The command line arguments
  def self.run(argv)
    Gtk.init
    GHtml2Pdf::Application.new(argv).run
  rescue GHtml2Pdf::MissingArgument => e
    warn e.message
    exit 1
  end
end
