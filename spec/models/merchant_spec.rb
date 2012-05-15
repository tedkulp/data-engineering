require 'spec_helper'

describe Merchant do
  let(:merchant) { build(:merchant) }

  describe "validations" do
    it "should not allow a blank name" do
      merchant.name = nil
      merchant.should_not be_valid
      merchant.name = ""
      merchant.should_not be_valid
    end

    it "should not allow a blank address" do
      merchant.address = nil
      merchant.should_not be_valid
      merchant.address = ""
      merchant.should_not be_valid
    end
  end
end
