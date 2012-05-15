require 'spec_helper'

describe "uploads/index" do
  before(:each) do
    assign(:uploads, [
      build_stubbed(:upload),
      build_stubbed(:upload)
    ])
  end

  it "renders a list of uploads" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
