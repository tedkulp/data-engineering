require 'spec_helper'

describe Item do

  describe "validations" do
    let(:item) { build(:item) }

    it "should not allow a blank description" do
      item.description = nil
      item.should_not be_valid
      item.description = ""
      item.should_not be_valid
    end

    it "should not allow a blank price" do
      item.price = nil
      item.should_not be_valid
    end

    it "should not allow an price below 0" do
      item.price = -1
      item.should_not be_valid
      item.price = 0
      item.should be_valid
    end
  end
end
