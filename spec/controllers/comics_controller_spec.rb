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

describe ComicsController do

  # This should return the minimal set of attributes required to create a valid
  # Comic. As you add validations to Comic, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ComicsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all comics as @comics" do
      comic = Comic.create! valid_attributes
      get :index, {}, valid_session
      assigns(:comics).should eq([comic])
    end
  end

  describe "GET show" do
    it "assigns the requested comic as @comic" do
      comic = Comic.create! valid_attributes
      get :show, {:id => comic.to_param}, valid_session
      assigns(:comic).should eq(comic)
    end
  end

  describe "GET new" do
    it "assigns a new comic as @comic" do
      get :new, {}, valid_session
      assigns(:comic).should be_a_new(Comic)
    end
  end

  describe "GET edit" do
    it "assigns the requested comic as @comic" do
      comic = Comic.create! valid_attributes
      get :edit, {:id => comic.to_param}, valid_session
      assigns(:comic).should eq(comic)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Comic" do
        expect {
          post :create, {:comic => valid_attributes}, valid_session
        }.to change(Comic, :count).by(1)
      end

      it "assigns a newly created comic as @comic" do
        post :create, {:comic => valid_attributes}, valid_session
        assigns(:comic).should be_a(Comic)
        assigns(:comic).should be_persisted
      end

      it "redirects to the created comic" do
        post :create, {:comic => valid_attributes}, valid_session
        response.should redirect_to(Comic.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved comic as @comic" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comic.any_instance.stub(:save).and_return(false)
        post :create, {:comic => {}}, valid_session
        assigns(:comic).should be_a_new(Comic)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comic.any_instance.stub(:save).and_return(false)
        post :create, {:comic => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested comic" do
        comic = Comic.create! valid_attributes
        # Assuming there are no other comics in the database, this
        # specifies that the Comic created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Comic.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => comic.to_param, :comic => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested comic as @comic" do
        comic = Comic.create! valid_attributes
        put :update, {:id => comic.to_param, :comic => valid_attributes}, valid_session
        assigns(:comic).should eq(comic)
      end

      it "redirects to the comic" do
        comic = Comic.create! valid_attributes
        put :update, {:id => comic.to_param, :comic => valid_attributes}, valid_session
        response.should redirect_to(comic)
      end
    end

    describe "with invalid params" do
      it "assigns the comic as @comic" do
        comic = Comic.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Comic.any_instance.stub(:save).and_return(false)
        put :update, {:id => comic.to_param, :comic => {}}, valid_session
        assigns(:comic).should eq(comic)
      end

      it "re-renders the 'edit' template" do
        comic = Comic.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Comic.any_instance.stub(:save).and_return(false)
        put :update, {:id => comic.to_param, :comic => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested comic" do
      comic = Comic.create! valid_attributes
      expect {
        delete :destroy, {:id => comic.to_param}, valid_session
      }.to change(Comic, :count).by(-1)
    end

    it "redirects to the comics list" do
      comic = Comic.create! valid_attributes
      delete :destroy, {:id => comic.to_param}, valid_session
      response.should redirect_to(comics_url)
    end
  end

end
