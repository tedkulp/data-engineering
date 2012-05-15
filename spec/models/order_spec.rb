require 'spec_helper'

describe Order do
  describe "validations" do
    let(:order) { build(:order) }

    it "should not allow a blank quantity" do
      order.quantity = nil
      order.should_not be_valid
    end

    it "should not allow anything but an integer in quantity" do
      order.quantity = 1.1
      order.should_not be_valid
      order.quantity = 1.0
      order.should_not be_valid
      order.quantity = 1
      order.should be_valid
    end

    it" should not allow a number below 0 in quantity" do
      order.quantity = -1
      order.should_not be_valid
      order.quantity = 0
      order.should be_valid
    end
  end
end
