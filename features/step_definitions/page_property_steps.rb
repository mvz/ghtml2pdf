# frozen_string_literal: true

Then(/^the file "([^"]*)" should have default page properties$/) do |file|
  full_path = expand_path(file)
  uri = "file://#{full_path}"
  doc = Poppler::Document.new_from_file uri

  expect(doc.get_n_pages).to eq 1

  page = doc.get_page 0
  size = page.size

  expect(size).to eq [595.0, 842.0] # A4 in points
end
