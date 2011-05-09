require 'spec_helper'

describe Project do
  it "is not valid without a user" do
    project = Factory.build :project, :user => nil
    project.should_not be_valid
  end
  
  it "is not valid without a country" do
    project = Factory.build :project, :country_code => nil
    project.should_not be_valid
  end
  
  it "is not valid without a description" do
    project = Factory.build :project, :description => nil
    project.should_not be_valid
  end
  
  it "is not valid without a sector" do
    project = Factory.build :project, :sector => nil
    project.should_not be_valid
  end
  
  it "is not valid without practices" do
    project = Factory.build :project, :practices => nil
    project.should_not be_valid
  end
  
  it "is not valid without obstacles" do
    project = Factory.build :project, :obstacles => nil
    project.should_not be_valid
  end
end