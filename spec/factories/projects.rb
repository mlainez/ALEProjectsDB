Factory.define :project do |f|
  f.association :user
  f.country_code{"BE"}
  f.sector      {"Government IT"}
  f.description {"Project description"}
  f.practices   {"Scrum"}
  f.obstacles   {"Management buy-in"}
  f.owner_role  {"Developer"}
end