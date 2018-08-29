require 'net/http'
require 'json'

class SearchController < ApplicationController

  def index

    url = 'https://api.thecatapi.com'
    api_key = '3758c3ed-ad4f-4fa7-b181-746071587ee2'
    user_id = 'nfzh4j'

    uri = URI(url+'/v1/images/search')
    res = Net::HTTP.get_response(uri)
    res['Content-Type'] = 'application/json'
    res['x-api-key'] = api_key
    @rnd_img = JSON.parse(res.body)


    @time = Time.now
    @name = Faker::Name.name
    @avatar = Faker::Avatar.image

  end
end