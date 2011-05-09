# MONKEY PATCH BECAUSE OF STUPID ERROR
module OmniAuth
  module Strategies
    class LinkedIn < OmniAuth::Strategies::OAuth
      def user_hash(access_token)
       person = MultiXml.parse(@access_token.get('/v1/people/~:(id,first-name,last-name,headline,member-url-resources,picture-url,location,public-profile-url)').body)['person']

        hash = {
          'id' => person['id'],
          'first_name' => person['first_name'],
          'last_name' => person['last_name'],
          'nickname' => person['public_profile_url'].split('/').last,
          'location' => person['location']['name'],
          'image' => person['picture_url'],
          'description' => person['headline'],
          'public_profile_url' => person['public_profile_url']
        }
        hash['urls']={}

        hash['urls']['LinkedIn'] = person['public_profile_url']
        hash['name'] = "#{hash['first_name']} #{hash['last_name']}"
        hash
      end
    end
  end
end