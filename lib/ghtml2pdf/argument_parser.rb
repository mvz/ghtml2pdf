module GHtml2Pdf
  # Parses the command line arguments
  class ArgumentParser
    attr_reader :input, :output

    # Error class raised for missing arguments
    class MissingArgument < StandardError; end

    def initialize(argv)
      @input, @output, = argv
      unless @input
        raise MissingArgument, 'An input filename is required'
      end
      unless @output
        raise MissingArgument, 'An output filename is required'
      end
    end
  end
end
