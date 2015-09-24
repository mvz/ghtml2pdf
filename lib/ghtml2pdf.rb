require 'ghtml2pdf/version'
require 'ghtml2pdf/application'

module GHtml2Pdf
  def self.run
    GHtml2Pdf::Application.new.run
  end
end
