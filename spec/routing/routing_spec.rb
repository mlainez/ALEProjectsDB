require 'spec_helper'

describe "omniauth callback" do
  it "redirects to sessions#create" do
    { :get => "/auth/:provider/callback" }.should 
        route_to( :controller => "sessions",
                  :action     => :create )
  end
end

describe "signout" do
  it "redirects to sessions#destroy" do
    { :delete => "/signout" }.should
        route_to( :controller => "sessions",
                  :action     => :destroy )
  end
end