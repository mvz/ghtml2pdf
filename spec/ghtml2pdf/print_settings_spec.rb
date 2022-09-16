# frozen_string_literal: true

require "spec_helper"

RSpec.describe GHtml2Pdf::PrintSettings do
  it "can be instantiated" do
    expect(described_class.new).to be_instance_of described_class
  end
end
