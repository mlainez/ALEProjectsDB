Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :linked_in, '86Q4kkdSeU6JZcswITwzvOvHV41QxhZ1vusOIqCKbbCDnQ6Qe_bctwrBKNZDenyg', 
                       'tiG4amfhxIJdoh9aW5SwxIuB_sOErUfPuFqmscJK6ofaI2rJ-v7Xe-EsqsWNfBQW'  
end