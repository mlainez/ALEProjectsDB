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

  describe "DELETE destroy" do
    let(:user)               { mock_model(User, :id => 1) }
    let(:project)            { mock_model(Project, :id => 1) }
    let(:projects)           { mock("Projects List") }

    before :each do
      @current_user = user
      session[:user_id] = user.id
      controller.stub!(:current_user).and_return(@current_user)
      user.stub!(:projects => projects)
      projects.stub!(:find => project)
    end

    it "redirects to my projects page" do
      delete :destroy, :id => project.id
      response.should redirect_to :action => :index
    end

    it "gets the user's projects" do
      user.should_receive(:projects)
      delete :destroy, :id => project.id
    end

    it "looks for the project to destroy" do
      projects.should_receive(:find).with(project.id)
      delete :destroy, :id => project.id
    end

    it "assigns that project" do
      delete :destroy, :id => project.id
      assigns[:project].should eq project
    end

    it "destroys the project" do
      project.should_receive(:destroy)
      delete :destroy, :id => project.id
    end

    context "when the project was destroyed" do
      it "sets the flash notice to 'Successfully deleted'" do
        project.stub!(:destroy => true)
        delete :destroy, :id => project.id
        flash[:notice].should eq "Successfully deleted"
      end

      it "has an empty error flash" do
        project.stub!(:destroy => true)
        delete :destroy, :id => project.id
        flash[:error].should be_nil
      end
    end
    context "when the project was not destroyed" do
      it "sets the flash error to 'Could not delete that project'" do
        project.stub!(:destroy => false)
        delete :destroy, :id => project.id
        flash[:error].should eq "Could not delete that project"
      end
    end
  end
end
