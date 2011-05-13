require 'spec_helper'

describe MyProjectsController do
  describe "GET index" do
    let(:user)               { mock_model(User, :id => 1) }
    let(:projects)           { mock("Projects List") }
    let(:paginated_projects) { mock("Paginated projects List") }
    
    before :each do
      @current_user = user
      session[:user_id] = user.id
      controller.stub!(:current_user).and_return(@current_user)
      user.stub!(:projects => projects)
      projects.stub!(:all => projects, :paginate => paginated_projects)
    end
    
    it "renders the projects/index template" do
      get :index
      response.should render_template("projects/index")
    end

    it "gets the user's project projects" do
      user.should_receive(:projects)
      get :index
    end
    
    it "queries all the user's projects" do
      projects.should_receive(:all)
      get :index
    end
    
    it "should paginate the projects" do
      projects.should_receive(:paginate)
      get :index
    end

    it "assigns the user's projects" do
      get :index
      assigns[:projects].should eq paginated_projects
    end
  end
end