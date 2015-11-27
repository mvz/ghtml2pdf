module GHtml2Pdf
  # Error class raised for missing arguments
  class MissingArgument < StandardError; end

  # Parses the command line arguments
  class ArgumentParser
    attr_reader :input, :output

    def initialize(argv)
      @input, @output, = argv
      raise MissingArgument, 'An input filename is required' unless @input
      raise MissingArgument, 'An output filename is required' unless @output
    end
  end
end
