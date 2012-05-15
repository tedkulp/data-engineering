require 'spec_helper'

describe "Merchants" do
  describe "GET /merchants" do
    it "should not work if the user isn't logged in" do
      get merchants_path
      response.status.should be(302)
      response.location.should include("/auth/open_id")
    end

    it "should work after logged in" do
      post '/auth/developer/callback', :name => 'Some User', :email => 'someone@someplace.com'
      get merchants_path
      response.status.should be(200)
    end
  end
end
