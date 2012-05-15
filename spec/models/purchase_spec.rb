require 'spec_helper'

describe Purchase do

  describe "validations" do
    let(:purchase) { build(:purchase) }

    it "should not allow a blank purchaser_name" do
      purchase.purchaser_name = nil
      purchase.should_not be_valid
      purchase.purchaser_name = ""
      purchase.should_not be_valid
    end

    it "should not allow a blank item_description" do
      purchase.item_description = nil
      purchase.should_not be_valid
      purchase.item_description = ""
      purchase.should_not be_valid
    end

    it "should not allow a blank item_price" do
      purchase.item_price = nil
      purchase.should_not be_valid
    end

    it "should not allow an item_price below 0" do
      purchase.item_price = -1
      purchase.should_not be_valid
      purchase.item_price = 0
      purchase.should be_valid
    end

    it "should not allow a blank purchase_count" do
      purchase.purchase_count = nil
      purchase.should_not be_valid
    end

    it "should not allow anything but an integer in purchase_count" do
      purchase.purchase_count = 1.1
      purchase.should_not be_valid
      purchase.purchase_count = 1.0
      purchase.should_not be_valid
      purchase.purchase_count = 1
      purchase.should be_valid
    end

    it" should not allow a number below 0 in purchase_count" do
      purchase.purchase_count = -1
      purchase.should_not be_valid
      purchase.purchase_count = 0
      purchase.should be_valid
    end

    it "should not allow a blank merchant_address" do
      purchase.merchant_address = nil
      purchase.should_not be_valid
      purchase.merchant_address = ""
      purchase.should_not be_valid
    end

    it "should not allow a blank merchant_name" do
      purchase.merchant_name = nil
      purchase.should_not be_valid
      purchase.merchant_name = ""
      purchase.should_not be_valid
    end
  end
end
