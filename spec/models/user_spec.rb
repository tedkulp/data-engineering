require 'spec_helper'

describe User do
  let(:user) { create(:user) }
  let(:data) { File.open(File.dirname(__FILE__) + "/../../example_input.tab", "r").read }

  describe ".destroy" do
    it "doesn't remove uploads if destroyed" do
      Upload.create_from_data(data, user)
      User.count.should eq(1)
      Upload.count.should eq(1)
      Purchase.count.should eq(4)

      user.destroy
      User.count.should eq(0)
      Upload.count.should eq(1)
      Purchase.count.should eq(4)
    end
  end
end
