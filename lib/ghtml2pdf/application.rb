require 'gir_ffi-gtk3'

GirFFI.setup :WebKit2, '4.0'

module GHtml2Pdf
  # Main GHtml2Pdf application. Orchestrates the Gtk+ objects needed to load
  # and print a web page to PDF.
  class Application
    attr_reader :input, :output

    def initialize(argv)
      @input, @output, = argv
      unless @input
        warn "An input filename is required"
        exit 1
      end
      unless @output
        warn "An output filename is required"
        exit 1
      end
    end

    def run
      web_view.signal_connect "load-changed" do |_, event, _|
        case event
        when :finished
          print_operation.print
          sleep 2
          Gtk.main_quit
        end
      end

      web_view.load_uri(input_uri)

      Gtk.main
    end

    private

    def print_operation
      page_setup = Gtk::PageSetup.new

      print_operation = WebKit2::PrintOperation.new(web_view)
      print_operation.page_setup = page_setup
      print_operation.print_settings = print_settings

      return print_operation
    end

    def web_view
      @web_view ||= WebKit2::WebView.new
    end

    def print_settings
      Gtk::PrintSettings.new.tap do |settings|
        settings.set_number_up 1
        settings.set_reverse false
        settings.set_print_pages :all
        settings.set 'output-uri', output_uri
        settings.set 'output-file-format', 'pdf'
        settings.set_collate false
        settings.set_n_copies 1
        settings.set_printer 'Print to File'
        settings.set_page_set :all
        settings.set_scale 100.0
      end
    end

    def output_uri
      "file://#{File.expand_path(output)}"
    end

    def input_uri
      "file://#{File.expand_path(input)}"
    end
  end
end
