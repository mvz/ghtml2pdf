require 'gir_ffi-gtk3'

module GHtml2Pdf
  class Application
    def run
      input, output, = ARGV
      unless input
        warn "An input filename is required"
        exit 1
      end
      unless output
        warn "An output filename is required"
        exit 1
      end
      input_uri = "file://#{File.expand_path(input)}"
      output_uri = "file://#{File.expand_path(output)}"

      GirFFI.setup :WebKit2, '4.0'

      Gtk.init

      win = Gtk::OffscreenWindow.new
      web_view = WebKit2::WebView.new
      win.add(web_view)

      page_setup = Gtk::PageSetup.new

      print_settings = Gtk::PrintSettings.new
      print_settings.set_number_up 1
      print_settings.set_reverse false
      print_settings.set_print_pages :all
      print_settings.set 'output-uri', output_uri
      print_settings.set 'output-file-format', 'pdf'
      print_settings.set_collate false
      print_settings.set_n_copies 1
      print_settings.set_printer 'Print to File'
      print_settings.set_page_set :all
      print_settings.set_scale 100.0

      print_operation = WebKit2::PrintOperation.new(web_view)
      print_operation.page_setup = page_setup
      print_operation.print_settings = print_settings

      web_view.signal_connect "load-changed" do |_, event, _|
        case event
        when :finished
          print_operation.print
          sleep 2
          Gtk.main_quit
        end
      end

      web_view.load_uri(input_uri)
      win.show_all

      Gtk.main
    end
  end
end
