class AddLinkedInPublicProfileLinkToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :linkedin_public_profile, :string, :null => false
  end

  def self.down
    remove_column :users, :linkedin_public_profile
  end
end
