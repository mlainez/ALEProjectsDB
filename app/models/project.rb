class Project < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :user
  validates_presence_of :country_code
  validates_presence_of :description
  validates_presence_of :sector
  validates_presence_of :practices
  validates_presence_of :obstacles
  
  index do
    description
    sector
    practices
    obstacles
  end
end