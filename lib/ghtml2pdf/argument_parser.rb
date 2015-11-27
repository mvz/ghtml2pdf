module GHtml2Pdf
  # Parses the command line arguments
  class ArgumentParser
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
  end
end
