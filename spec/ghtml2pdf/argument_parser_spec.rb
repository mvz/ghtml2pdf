# frozen_string_literal: true

require "spec_helper"

describe GHtml2Pdf::ArgumentParser do
  it "parses a top margin" do
    parser = described_class.new ["--top-margin", "3mm", "INFILE", "OUTFILE"]
    expect(parser.top_margin).to eq Unit.new("3mm")
  end

  it "parses a bottom margin" do
    parser = described_class.new ["--bottom-margin", "3mm", "INFILE", "OUTFILE"]
    expect(parser.bottom_margin).to eq Unit.new("3mm")
  end

  it "parses a left margin" do
    parser = described_class.new ["--left-margin", "3mm", "INFILE", "OUTFILE"]
    expect(parser.left_margin).to eq Unit.new("3mm")
  end

  it "parses a right margin" do
    parser = described_class.new ["--right-margin", "3mm", "INFILE", "OUTFILE"]
    expect(parser.right_margin).to eq Unit.new("3mm")
  end

  it "sets outfile based on infile with html extension" do
    parser = described_class.new ["foobar.html"]
    expect(parser.output).to eq "foobar.pdf"
  end

  it "sets outfile based on infile with htm extension" do
    parser = described_class.new ["foobar.htm"]
    expect(parser.output).to eq "foobar.pdf"
  end

  it "raises an error if infile and outfile are the same" do
    expect { described_class.new ["INFILE", "INFILE"] }
      .to raise_error GHtml2Pdf::ArgumentError
  end
end
