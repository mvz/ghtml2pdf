# frozen_string_literal: true

require "gir_ffi-gtk3"
require "ghtml2pdf/argument_parser"
require "ghtml2pdf/print_settings"

GirFFI.setup :WebKit2

module GHtml2Pdf
  # Main GHtml2Pdf application. Orchestrates the Gtk+ objects needed to load
  # and print a web page to PDF.
  class Application
    def initialize(argv)
      @argument_parser = ArgumentParser.new(argv)
      default_web_context.set_process_model :multiple_secondary_processes
    end

    def run
      setup_signal_handlers
      load_uri
      Gtk.main
      destroy_view
    end

    private

    attr_reader :argument_parser

    def setup_signal_handlers
      web_view.signal_connect "load-changed" do |_, event, _|
        case event
        when :finished
          print_operation.print
        end
      end

      print_operation.signal_connect "finished" do |*_args|
        Gtk.main_quit
      end
    end

    def load_uri
      web_view.load_uri(input_uri)
    end

    def destroy_view
      web_view.destroy
    end

    def top_margin
      @top_margin ||= argument_parser.top_margin || Unit.new("2cm")
    end

    def bottom_margin
      @bottom_margin ||= argument_parser.bottom_margin || Unit.new("3cm")
    end

    def left_margin
      @left_margin ||= argument_parser.left_margin || Unit.new("2cm")
    end

    def right_margin
      @right_margin ||= argument_parser.right_margin || Unit.new("2cm")
    end

    def print_operation
      @print_operation ||= WebKit2::PrintOperation.new(web_view).tap do |operation|
        operation.page_setup = page_setup
        operation.print_settings = print_settings
      end
    end

    def page_setup
      @page_setup ||= Gtk::PageSetup.new.tap do |setup|
        setup.set_paper_size Gtk::PaperSize.new Gtk::PAPER_NAME_A4
        setup.set_top_margin top_margin_in_mm, :mm
        setup.set_bottom_margin bottom_margin_in_mm, :mm
        setup.set_left_margin left_margin_in_mm, :mm
        setup.set_right_margin right_margin_in_mm, :mm
      end
    end

    def top_margin_in_mm
      top_margin.convert_to("mm").scalar
    end

    def bottom_margin_in_mm
      bottom_margin.convert_to("mm").scalar
    end

    def left_margin_in_mm
      left_margin.convert_to("mm").scalar
    end

    def right_margin_in_mm
      right_margin.convert_to("mm").scalar
    end

    def default_web_context
      @default_web_context ||= WebKit2::WebContext.get_default
    end

    def web_view
      @web_view ||= WebKit2::WebView.new
    end

    def print_settings
      @print_settings ||= PrintSettings.new.tap { _1.output_uri = output_uri }
    end

    def output_uri
      "file://#{File.expand_path(argument_parser.output)}"
    end

    def input_uri
      "file://#{File.expand_path(argument_parser.input)}"
    end
  end
end
