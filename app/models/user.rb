class User < ActiveRecord::Base
  has_many :projects
  
  def self.find_by_auth_hash(auth_hash)
    find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
  end
  
  def self.create_with_auth_hash(auth_hash)  
    create! do |user|  
      user.provider = auth_hash["provider"]  
      user.uid = auth_hash["uid"]  
      user.name = auth_hash["user_info"]["name"]
      user.linkedin_public_profile = auth_hash["user_info"]["public_profile_url"] 
    end  
  end
end
