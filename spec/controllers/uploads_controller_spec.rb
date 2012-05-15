require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe UploadsController do

  # This should return the minimal set of attributes required to create a valid
  # Upload. As you add validations to Upload, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    attributes_for(:upload)
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UploadsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all uploads as @uploads" do
      upload = Upload.create! valid_attributes
      get :index, {}, valid_session
      assigns(:uploads).should eq([upload])
    end
  end

  describe "GET show" do
    it "assigns the requested upload as @upload" do
      upload = Upload.create! valid_attributes
      get :show, {:id => upload.to_param}, valid_session
      assigns(:upload).should eq(upload)
    end
  end

  describe "GET new" do
    it "assigns a new upload as @upload" do
      get :new, {}, valid_session
      assigns(:upload).should be_a_new(Upload)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      let(:data_file) { File.dirname(__FILE__) + "/../../example_input.tab" }

      it "creates a new Upload" do
        expect {
          post :create, {:upload => valid_attributes}, valid_session
        }.to change(Upload, :count).by(1)
      end

      it "assigns a newly created upload as @upload" do
        post :create, {:upload => valid_attributes}, valid_session
        assigns(:upload).should be_a(Upload)
        assigns(:upload).should be_persisted
        assigns(:upload).purchases.should be_empty
      end

      it "redirects to the created upload" do
        post :create, {:upload => valid_attributes}, valid_session
        response.should redirect_to(Upload.last)
      end

      it "creates the purchase objects if given data" do
        file = Rack::Test::UploadedFile.new(data_file, "text/plain")
        post :create, {:upload => valid_attributes, :data_file => file}, valid_session
        assigns(:upload).should be_a(Upload)
        assigns(:upload).purchases.should have(4).purchases
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved upload as @upload" do
        # Trigger the behavior that occurs when invalid params are submitted
        Upload.any_instance.stub(:save).and_return(false)
        post :create, {:upload => {}}, valid_session
        assigns(:upload).should be_a_new(Upload)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Upload.any_instance.stub(:save).and_return(false)
        post :create, {:upload => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested upload" do
      upload = Upload.create! valid_attributes
      expect {
        delete :destroy, {:id => upload.to_param}, valid_session
      }.to change(Upload, :count).by(-1)
    end

    it "redirects to the uploads list" do
      upload = Upload.create! valid_attributes
      delete :destroy, {:id => upload.to_param}, valid_session
      response.should redirect_to(uploads_url)
    end
  end

end
