require 'spec_helper'

describe User do
  it "should have many projects" do
    User.reflect_on_association(:projects).should_not be_nil
  end
  
  describe :find_by_auth_hash do
    let(:auth_hash) { {"provider" => "linked_in", "uid" => "azerty"} }

    it "searches a user by provider and uid" do
      User.should_receive(:find_by_provider_and_uid).with(auth_hash["provider"], auth_hash["uid"])
      User.find_by_auth_hash(auth_hash)
    end
  end
  
  describe :create_with_auth_hash do
    let(:auth_hash) { {"provider" => "linked_in", "uid" => "azerty", "user_info" => {"name" => "John Doe"}} }
    
    it "creates a new user based on the auth hash" do
      User.should_receive(:create!)
      User.create_with_auth_hash(auth_hash)
    end
  end
end