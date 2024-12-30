# frozen_string_literal: true

require "pdf/reader"
require "stringio"

Then(/^the file "([^"]*)" should have default page properties$/) do |file|
  io = File.open expand_path(file)
  reader = PDF::Reader.new(io)

  reader.pages.each do |page|
    box = page.attributes[:MediaBox]

    aggregate_failures "A4 page size" do
      expect(box[0]).to eq 0
      expect(box[1]).to eq 0
      expect(box[2]).to eq 595
      expect(box[3]).to eq 842
    end
  end
end
