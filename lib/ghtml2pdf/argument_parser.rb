# frozen_string_literal: true

require "optparse"
require "ruby-units"

module GHtml2Pdf
  # Error class raised for argument errors
  class ArgumentError < StandardError; end

  # Parses the command line arguments
  class ArgumentParser
    attr_reader :input, :output, :top_margin, :bottom_margin, :left_margin, :right_margin

    def initialize(argv)
      setup_banner
      setup_margin_options
      setup_help_message
      parser.parse! argv
      @input, @output, = argv
      raise MissingArgument, "An input filename is required" unless @input

      @output ||= "#{File.basename(@input, ".*")}.pdf"
      raise ArgumentError, "Input and output files cannot be the same" if @input == @output
    end

    private

    def parser
      @parser ||= OptionParser.new
    end

    def setup_banner
      parser.banner = "Usage: #{parser.program_name} [options] INFILE OUTFILE"
    end

    def setup_margin_options
      parser.on("--top-margin MARGIN", "Set top margin") { |val| self.top_margin = val }
      parser.on("--bottom-margin MARGIN", "Set bottom margin") do |val|
        self.bottom_margin = val
      end
      parser.on("--left-margin MARGIN", "Set left margin") { |val| self.left_margin = val }
      parser.on("--right-margin MARGIN", "Set right margin") do |val|
        self.right_margin = val
      end
    end

    def setup_help_message
      parser.on_tail("-h", "--help", "Show this message") do
        puts parser
        exit
      end
    end

    def top_margin=(val)
      @top_margin = Unit.new(val)
    end

    def bottom_margin=(val)
      @bottom_margin = Unit.new(val)
    end

    def left_margin=(val)
      @left_margin = Unit.new(val)
    end

    def right_margin=(val)
      @right_margin = Unit.new(val)
    end
  end
end
