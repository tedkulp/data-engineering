require 'spec_helper'

describe "orders/show" do
  before(:each) do
    @item = create(:item)
    @order = build_stubbed(:order, :item => @item)
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(@item.description)
    rendered.should match(/1/)
  end
end
