require 'spec_helper'

describe SessionsController do
  describe "POST create" do
    let(:user)          { Factory :user }
    let(:omniauth_hash) { {"provider" => "linked_in", "uid" => "azerty"} }
    
    before :each do
      User.stub!(:find_by_auth_hash => user)
      controller.stub!(:auth_hash => omniauth_hash)
    end

    it "redirects to home#index" do
      post :create, :provider => "linked_in"
      response.should redirect_to(:controller => "home", :action => "index")
    end
    
    it "sets the flash to 'Signed in!'" do
      post :create, :provider => "linked_in"
      flash[:notice].should eq("Signed in!")
    end
    
    context "when a user with the omniauth credentials already exists" do
      let(:user) { Factory :user }
      
      before :each do
        User.stub!(:find_by_auth_hash => user)
      end
      
      it "fetches the user from the database and assigns it" do
        post :create, :provider => "linked_in"
        assigns(:user).should eq(user)
      end
      
      it "sets the session user id to the fetched user id" do
        post :create, :provider => "linked_in"
        session[:user_id].should eq(user.id)
      end
    end
    
    context "when there is no existing user with the omniauth credentials" do
      let(:user) { Factory :user }
      
      before :each do
        User.stub!(:find_by_auth_hash => nil)
        User.stub!(:create_with_auth_hash => user)
      end
      
      it "creates a new user with theses credentials" do
        post :create, :provider => "linked_in"
        assigns(:user).should eq(user)
      end
      
      it "sets the session user id to the fetched user id" do
        post :create, :provider => "linked_in"
        session[:user_id].should eq(user.id)
      end
    end
  end
end