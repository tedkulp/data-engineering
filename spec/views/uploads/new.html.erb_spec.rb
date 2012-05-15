require 'spec_helper'

describe "uploads/new" do
  before(:each) do
    assign(:upload, build_stubbed(:upload))
  end

  it "renders new upload form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => uploads_path, :method => "post" do
    end
  end
end
