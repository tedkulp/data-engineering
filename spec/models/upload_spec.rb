require 'spec_helper'

describe Upload do

  let(:data) { File.open(File.dirname(__FILE__) + "/../../example_input.tab", "r").read }

  describe ".create_from_data" do
    it "should parse and build purchase models" do
      upload = Upload.create_from_data(data)
      upload.should_not be_nil
      upload.purchases.should have(4).purchases
    end

    it "should properly handle no data" do
      upload = Upload.create_from_data("")
      upload.should_not be_nil
      upload.purchases.should be_empty
    end

    it "should properly handle bad data" do
      upload = Upload.create_from_data("vmnsdlkj23risdjknx,mnwerl;kj\t\t\t\t\n\n\twf")
      upload.should_not be_nil
      upload.purchases.should be_empty
    end

    it "should set the total_revenue of all the purchases if given valid data" do
      upload = Upload.create_from_data(data)
      upload.total_revenue.should eq(30.0)
    end

    it "should optionally allow a user to be passed so we know who uploaded the data" do
      user = create(:user)
      upload = Upload.create_from_data(data, user)
      upload.user.should eq(user)
    end
  end

  describe ".destroy" do
    it "removes all the associated purchases" do
      upload = Upload.create_from_data(data)
      Purchase.count.should eq(4)
      upload.destroy
      Purchase.count.should eq(0)
    end
  end

end
