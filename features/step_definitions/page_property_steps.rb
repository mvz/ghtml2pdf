# frozen_string_literal: true

require 'pdf/reader'
require 'stringio'

Then(/^the file "([^"]*)" should have default page properties$/) do |file|
  pdf_data = read(file).join("\n")
  io = StringIO.new(pdf_data)
  reader = PDF::Reader.new(io)

  reader.pages.each do |page|
    box = page.attributes[:MediaBox]
    aggregate_failures 'A4 page size' do
      expect(box[0]).to eq 0
      expect(box[1]).to eq 0
      expect(box[2]).to be_within(0.01).of 595.28
      expect(box[3]).to be_within(0.01).of 841.89
    end
  end
end
