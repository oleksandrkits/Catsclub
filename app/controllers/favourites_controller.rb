require 'net/http'
require 'json'

class FavouritesController < ApplicationController

  def index
    @url ='https://api.thecatapi.com/v1/favourites'
    @api_key = '3758c3ed-ad4f-4fa7-b181-746071587ee2'
    uri = URI.parse(@url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    header = {'Content-Type': 'application/json', 'x-api-key': @api_key}
    request = Net::HTTP::Get.new(uri, header)
    response = http.request(request)
    @resp = JSON.parse(response.read_body)
  end

  def new
    @user_id = 'nfzh4j'
    puts 'HAHAHA'
  end

  def create
    @api_key = '3758c3ed-ad4f-4fa7-b181-746071587ee2'
    @user_id = 'nfzh4j'
    uri = URI.parse('https://api.thecatapi.com/v1/favourites')


    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    header = {'Content-Type': 'application/json',
              'x-api-key': @api_key
    }

    request = Net::HTTP::Post.new(uri, header)

    user = {'image_id': params['image_id'],
            'sub_id': @user_id
    }

    puts user.to_json
    request.body = user.to_json
    response = http.request(request)
    puts response.read_body

    redirect_to "/favourites"
  end

end
