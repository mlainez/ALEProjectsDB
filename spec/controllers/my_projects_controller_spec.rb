require 'spec_helper'

describe MyProjectsController do
  describe "GET index" do
    let(:user)     { mock_model(User, :id => 1) }
    let(:projects) { mock("Projects List") }
    
    before :each do
      @current_user = user
      session[:user_id] = user.id
      controller.stub!(:current_user).and_return(@current_user)
      user.stub!(:projects => projects)
    end
    
    it "renders the projects/index template" do
      get :index
      response.should render_template("projects/index")
    end

    it "gets the user's project projects" do
      user.should_receive(:projects)
      get :index
    end

    it "assigns the user's projects" do
      get :index
      assigns[:projects].should eq projects
    end
  end
end