require 'spec_helper'

describe SearchesController do
  describe "GET index" do
    let(:params)   { {"search-field" => "Government"} }
    let(:projects) { mock("Projects list") }
    
    before :each do
      Project.stub!(:search => projects)
      projects.stub!(:paginate => projects)
    end
    
    it "searches the projects" do
      Project.should_receive(:search).with(params["search-field"])
      get :index, params
    end
    
    it "should paginate the projects" do
      projects.should_receive(:paginate)
      get :index
    end
    
    it "assigns these projects" do
      get :index, params
      assigns[:projects].should eq projects
    end
    
    it "renders the index template" do
      get :index, params
      response.should render_template("index")
    end
  end
end