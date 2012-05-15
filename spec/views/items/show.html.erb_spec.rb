require 'spec_helper'

describe "items/show" do
  before(:each) do
    @merchant = create(:merchant)
    @item = assign(:item, build_stubbed(:item, :merchant => @merchant))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Item Description/)
    rendered.should match(/9.99/)
    rendered.should match(@merchant.name)
  end
end
