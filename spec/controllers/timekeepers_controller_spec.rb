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

describe TimekeepersController do

  # This should return the minimal set of attributes required to create a valid
  # Timekeeper. As you add validations to Timekeeper, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "login" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TimekeepersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all timekeepers as @timekeepers" do
      timekeeper = Timekeeper.create! valid_attributes
      get :index, {}, valid_session
      assigns(:timekeepers).should eq([timekeeper])
    end
  end

  describe "GET show" do
    it "assigns the requested timekeeper as @timekeeper" do
      timekeeper = Timekeeper.create! valid_attributes
      get :show, {:id => timekeeper.to_param}, valid_session
      assigns(:timekeeper).should eq(timekeeper)
    end
  end

  describe "GET new" do
    it "assigns a new timekeeper as @timekeeper" do
      get :new, {}, valid_session
      assigns(:timekeeper).should be_a_new(Timekeeper)
    end
  end

  describe "GET edit" do
    it "assigns the requested timekeeper as @timekeeper" do
      timekeeper = Timekeeper.create! valid_attributes
      get :edit, {:id => timekeeper.to_param}, valid_session
      assigns(:timekeeper).should eq(timekeeper)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Timekeeper" do
        expect {
          post :create, {:timekeeper => valid_attributes}, valid_session
        }.to change(Timekeeper, :count).by(1)
      end

      it "assigns a newly created timekeeper as @timekeeper" do
        post :create, {:timekeeper => valid_attributes}, valid_session
        assigns(:timekeeper).should be_a(Timekeeper)
        assigns(:timekeeper).should be_persisted
      end

      it "redirects to the created timekeeper" do
        post :create, {:timekeeper => valid_attributes}, valid_session
        response.should redirect_to(Timekeeper.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved timekeeper as @timekeeper" do
        # Trigger the behavior that occurs when invalid params are submitted
        Timekeeper.any_instance.stub(:save).and_return(false)
        post :create, {:timekeeper => { "login" => "invalid value" }}, valid_session
        assigns(:timekeeper).should be_a_new(Timekeeper)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Timekeeper.any_instance.stub(:save).and_return(false)
        post :create, {:timekeeper => { "login" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested timekeeper" do
        timekeeper = Timekeeper.create! valid_attributes
        # Assuming there are no other timekeepers in the database, this
        # specifies that the Timekeeper created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Timekeeper.any_instance.should_receive(:update).with({ "login" => "MyString" })
        put :update, {:id => timekeeper.to_param, :timekeeper => { "login" => "MyString" }}, valid_session
      end

      it "assigns the requested timekeeper as @timekeeper" do
        timekeeper = Timekeeper.create! valid_attributes
        put :update, {:id => timekeeper.to_param, :timekeeper => valid_attributes}, valid_session
        assigns(:timekeeper).should eq(timekeeper)
      end

      it "redirects to the timekeeper" do
        timekeeper = Timekeeper.create! valid_attributes
        put :update, {:id => timekeeper.to_param, :timekeeper => valid_attributes}, valid_session
        response.should redirect_to(timekeeper)
      end
    end

    describe "with invalid params" do
      it "assigns the timekeeper as @timekeeper" do
        timekeeper = Timekeeper.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Timekeeper.any_instance.stub(:save).and_return(false)
        put :update, {:id => timekeeper.to_param, :timekeeper => { "login" => "invalid value" }}, valid_session
        assigns(:timekeeper).should eq(timekeeper)
      end

      it "re-renders the 'edit' template" do
        timekeeper = Timekeeper.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Timekeeper.any_instance.stub(:save).and_return(false)
        put :update, {:id => timekeeper.to_param, :timekeeper => { "login" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested timekeeper" do
      timekeeper = Timekeeper.create! valid_attributes
      expect {
        delete :destroy, {:id => timekeeper.to_param}, valid_session
      }.to change(Timekeeper, :count).by(-1)
    end

    it "redirects to the timekeepers list" do
      timekeeper = Timekeeper.create! valid_attributes
      delete :destroy, {:id => timekeeper.to_param}, valid_session
      response.should redirect_to(timekeepers_url)
    end
  end

end
