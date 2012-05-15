require 'spec_helper'

describe "orders/index" do
  before(:each) do
    @item = create(:item)
    assign(:orders, [
      build_stubbed(:order, :item => @item),
      build_stubbed(:order, :item => @item)
    ])
  end

  it "renders a list of orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => @item.description, :count => 2
  end
end
