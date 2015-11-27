require 'ghtml2pdf/version'
require 'ghtml2pdf/application'

module GHtml2Pdf
  def self.run(argv)
    GHtml2Pdf::Application.new(argv).run
  end
end
