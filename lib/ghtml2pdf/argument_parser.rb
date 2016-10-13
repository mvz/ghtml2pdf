require 'optparse'
require 'ruby-units'

module GHtml2Pdf
  # Error class raised for missing arguments
  class MissingArgument < StandardError; end

  # Parses the command line arguments
  class ArgumentParser
    attr_reader :input, :output
    attr_reader :top_margin, :bottom_margin, :left_margin, :right_margin

    def initialize(argv)
      option_parser.parse! argv
      @input, @output, = argv
      raise MissingArgument, 'An input filename is required' unless @input
      raise MissingArgument, 'An output filename is required' unless @output
    end

    def option_parser
      @option_parser ||=
        OptionParser.new.tap do |parser|
          parser.banner = "Usage: #{parser.program_name} [options] INFILE OUTFILE"
          parser.on('--top-margin MARGIN', 'Set top margin') { |val| self.top_margin = val }
          parser.on('--bottom-margin MARGIN', 'Set bottom margin') { |val| self.bottom_margin = val }
          parser.on('--left-margin MARGIN', 'Set left margin') { |val| self.left_margin = val }
          parser.on('--right-margin MARGIN', 'Set right margin') { |val| self.right_margin = val }
          parser.on_tail('-h', '--help', 'Show this message') do
            puts parser
            exit
          end
        end
    end

    private

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
