Before('@omniauth_test') do
  OmniAuth.config.test_mode = true

  # the symbol passed to mock_auth is the same as the name of the provider set up in the initializer
  OmniAuth.config.mock_auth[:default] = {
      "provider"=>"linked_in",
      "uid"=>"15OBOHsSYs",
      "user_info"=>{"first_name"         =>"John", 
                    "last_name"          =>"Doe", 
                    "nickname"           =>"johndoe", 
                    "name"               => "John Doe", 
                    "public_profile_url" => "http://www.example.com" }
  }
end

After('@omniauth_test') do
  OmniAuth.config.test_mode = false
end

Before('@omniauth_failure_test') do
  OmniAuth.config.test_mode           = true
  OmniAuth.config.mock_auth[:default] = :invalid_credentials
end

After('@omniauth_failure_test') do
  OmniAuth.config.test_mode = false
end