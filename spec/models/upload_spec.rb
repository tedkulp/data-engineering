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
  end

end
