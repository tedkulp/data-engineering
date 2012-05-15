require 'spec_helper'

describe "items/index" do
  before(:each) do
    @merchant = create(:merchant)
    assign(:items, [
      create(:item, :merchant => @merchant),
      create(:item, :merchant => @merchant)
    ])
  end

  it "renders a list of items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Item Description".to_s, :count => 2
  end
end
