require 'spec_helper'

describe AuthFailuresController do
  describe "GET new" do
    it "redirects to the home page" do
      get :new
      response.should redirect_to root_path
    end

    it "sets the error flash to 'Authentication failure'" do
      get :new
      flash[:error].should eq "Authentication failure"
    end
  end
end
