Factory.define :user do |f|
  f.name                    'John Doe'
  f.provider                'Linkedin'
  f.linkedin_public_profile 'http://www.example.com'
end