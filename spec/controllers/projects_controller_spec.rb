require 'spec_helper'

describe ProjectsController do
  describe "GET index" do
    let(:projects)           { mock("Projects list") }
    let(:paginated_projects) { mock("Paginated projects") }

    before :each do
      Project.stub!(:all => projects)
      projects.stub!(:paginate => paginated_projects)
    end

    it "renders the index template" do
      get :index
      response.should render_template("index")
    end

    it "gets all projects" do
      Project.should_receive(:all)
      get :index
    end

    it "should paginate the projects" do
      projects.should_receive(:paginate)
      get :index
    end

    it "assigns the projects" do
      get :index
      assigns[:projects].should eq paginated_projects
    end
  end

  describe "GET new" do
    context "when the user is logged in" do
      let(:user) { mock_model(User, :uid => "azerty", :provider => "linked_in", :id => 1) }

      before :each do
        session[:user_id] = user.id
      end

      it "renders the new template" do
        get :new
        response.should render_template("new")
      end
    end

    context "when the user is not logged in" do
      it "redirects to the linked in authentication page" do
        get :new
        response.should redirect_to('/auth/linked_in')
      end
    end
  end

  describe "POST create" do
    let(:user)         { mock_model(User, :uid => "azerty", :provider => "linked_in", :id => 1) }
    let(:project)      { mock_model(Project).as_null_object }
    let(:project_hash) { {"user_id" => user.id, "country_code" => "BE"} }

    before :each do
      session[:user_id] = user.id
      Project.stub!(:new).and_return(project)
    end

    it "creates a new project with the given params" do
      Project.should_receive(:new).with(project_hash).and_return(project)
      post :create, :project => project_hash
    end

    it "redirects to the index action" do
      post :create
      response.should redirect_to(:action => :index)
    end

    it "saves the project" do
      Project.stub!(:new).and_return(project)
      project.should_receive(:save)
      post :create
    end

    context "when the project saves successfully" do
      before :each do
        project.stub!(:save).and_return true
      end

      it "sets a flash[:notice] message" do
        post :create
        flash[:notice].should eq("The project was saved successfully")
      end

      it "redirects to the projects index" do
        post :create
        response.should redirect_to(:action => :index)
      end
    end

    context "when the project fails to save" do
      before :each do
        project.stub!(:save).and_return false
      end

      it "assigns @project" do
        post :create
        assigns[:project].should eq project
      end

      it "renders the new template" do
        post :create
        response.should render_template("new")
      end
    end
  end

  describe "GET edit" do
    let(:user)          { mock_model(User, :uid => "azerty", :provider => "linked_in", :id => 1) }
    let(:project)       { mock_model(Project, :user => user, :id => 10)}

    before :each do
      session[:user_id] = user.id
      controller.stub!(:current_user => user)
      controller.stub!(:find_project => project)
    end

    it "renders the edit template" do
      get :edit, :id => project.id
      response.should render_template("edit")
    end
  end

  describe "PUT update" do
    let(:user)          { mock_model(User, :uid => "azerty", :provider => "linked_in", :id => 1) }
    let(:project)       { mock_model(Project, :user => user, :id => 10)}
    let(:params)        { { :project => {"sector" => "Education"}, :id => project.id } }

    before :each do
      allow_message_expectations_on_nil
      session[:user_id] = user.id
      controller.stub!(:current_user => user)
      project.stub!(:attributes= => nil, :save => nil)
      user.stub!(:projects)
      user.projects.stub!(:find => project)
    end

    it "updates the projects fields with the values submitted" do
      project.should_receive(:attributes=).with(params[:project])
      put :update, params
    end

    it "saves the project" do
      project.should_receive(:save)
      put :update, params
    end

    context "when the project successfully saves" do
      before :each do
        project.stub!(:save => true)
      end

      it "sets the flash[:notice] to 'Project updated successfully'" do
        put :update, params
        flash[:notice].should eq "Project updated successfully"
      end

      it "redirects to the projects index" do
        put :update, params
        response.should redirect_to(:action => :index)
      end
    end

    context "when the project couldn't save" do
      before :each do
        project.stub!(:save => false)
      end

      it "sets the flash[:error] to 'The changes could not be saved'" do
        put :update, params
        flash[:error].should eq "The changes could not be saved"
      end

      it "renders the edit template" do
        put :update, params
        response.should render_template("edit")
      end
    end
  end

  describe :find_project do
    let(:user)          { mock_model(User, :uid => "azerty", :provider => "linked_in", :id => 1) }
    let(:user_projects) { mock("User projects") }
    let(:project)       { mock_model(Project, :user => user, :id => 10)}
    let(:params)        { mock("Params", :id => project.id)}

    before :each do
      session[:user_id] = user.id
      controller.stub!(:current_user => user)
      user.stub!(:projects => user_projects)
      user_projects.stub!(:find => project)
    end

    it "finds the user's project" do
      user.should_receive(:projects).and_return(user_projects)
      user_projects.should_receive(:find).with(project.id).and_return(project)
      get :edit, :id => project.id
    end

    it "assigns that project" do
      get :edit, :id => project.id
      assigns[:project].should eq project
    end
  end
end
