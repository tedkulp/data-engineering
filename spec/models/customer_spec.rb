require 'spec_helper'

describe Customer do

  describe "validations" do
    let(:customer) { build(:customer) }

    it "should not allow a blank name" do
      customer.name = nil
      customer.should_not be_valid
      customer.name = ""
      customer.should_not be_valid
    end
  end
end
