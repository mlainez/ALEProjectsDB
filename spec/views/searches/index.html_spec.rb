require 'spec_helper'

describe "searches/index.html.erb" do
  it "renders the projects partial" do
    @projects = [mock_model(Project, :sector => "Government IT")]
    render
    view.should render_template(:partial => 'shared/_projects')
  end
end