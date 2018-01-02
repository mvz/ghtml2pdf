# frozen_string_literal: true

require 'gir_ffi-gtk3'

module GHtml2Pdf
  # Specialized PrintSettings class for printing to a file.
  class PrintSettings < Gtk::PrintSettings
    def initialize
      super
      set_number_up 1
      set_reverse false
      set_print_pages :all
      set 'output-file-format', 'pdf'
      set_collate false
      set_n_copies 1
      set_printer 'Print to File'
      set_page_set :all
      set_scale 100.0
    end

    def output_uri=(uri)
      set 'output-uri', uri
    end
  end
end
