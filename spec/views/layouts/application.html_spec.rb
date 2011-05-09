require 'spec_helper'

describe "layouts/application.html.erb" do
  context "when there is no logged in user" do
    it "shows a sign in link" do
      view.should_receive(:current_user).and_return(nil)
      render
      rendered.should contain("Sign in with Linkedin")
    end
  end

  context "when there is a logged in user" do
    it "shows the user's name" do
      user = Factory.build(:user)
      view.should_receive(:current_user).at_least(:once).and_return(user)
      render
      rendered.should contain(user.name)
    end
  end
end