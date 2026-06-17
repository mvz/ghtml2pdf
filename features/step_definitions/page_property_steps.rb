# frozen_string_literal: true

Then(/^the file "([^"]*)" should have default page properties$/) do |file|
  full_path = expand_path(file)
  info = `pdfinfo #{full_path}`

  expect(info).to match(/Page size: +595 x 842 pts \(A4\)/)
  expect(info).to match(/Pages: +1\n/)
end
