class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.references :user,         :null => false
      t.string     :sector,       :null => false
      t.string     :country_code, :null => false      
      t.text       :description,  :null => false
      t.string     :practices,    :null => false
      t.string     :obstacles,    :null => false
      t.string     :owner_role,   :null => false
      t.date       :start_date
      t.date       :end_date
    end
  end

  def self.down
    drop_table :projects
  end
end
