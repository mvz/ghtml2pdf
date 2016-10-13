require 'spec_helper'

describe GHtml2Pdf::ArgumentParser do
  it 'parses a top margin' do
    parser = described_class.new ['--top-margin', '3mm', 'INFILE', 'OUTFILE']
    expect(parser.top_margin).to eq Unit.new('3mm')
  end

  it 'parses a bottom margin' do
    parser = described_class.new ['--bottom-margin', '3mm', 'INFILE', 'OUTFILE']
    expect(parser.bottom_margin).to eq Unit.new('3mm')
  end

  it 'parses a left margin' do
    parser = described_class.new ['--left-margin', '3mm', 'INFILE', 'OUTFILE']
    expect(parser.left_margin).to eq Unit.new('3mm')
  end

  it 'parses a right margin' do
    parser = described_class.new ['--right-margin', '3mm', 'INFILE', 'OUTFILE']
    expect(parser.right_margin).to eq Unit.new('3mm')
  end
end
