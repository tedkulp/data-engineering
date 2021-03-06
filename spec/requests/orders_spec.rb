require 'spec_helper'

describe "Orders" do
  describe "GET /orders" do
    it "should not work if the user isn't logged in" do
      get orders_path
      response.status.should be(302)
      response.location.should include("/auth/open_id")
    end

    it "should work after logged in" do
      post '/auth/developer/callback', :name => 'Some User', :email => 'someone@someplace.com'
      get orders_path
      response.status.should be(200)
    end
  end
end
