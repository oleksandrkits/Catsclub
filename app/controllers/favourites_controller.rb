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
    @resp = response.read_body
    puts "hj"
  end

  def new
    @user_id = 'nfzh4j'
    puts 'HAHAHA'
  end

  def create
    @api_key = '3758c3ed-ad4f-4fa7-b181-746071587ee2'
    @user_id = 'nfzh4j'
    uri = URI.parse('https://api.thecatapi.com/v1/favourites')
    # req = Net::HTTP::Post.new(uri.path)
    # req.set_form_data('image_id' => params["image_id"], 'sub_id' => @user_id)
    # req['Content-Type'] = 'application/json'
    # req['x-api-key'] = @api_key
    # #puts "Img #{img_id} is added to your favourites."



    header = {'Content-Type': 'text/json',
              'x-api-key': @api_key
    }
    user = {'image_id': params['image_id'],
            'sub_id': @user_id
    }

    # Create the HTTP objects
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri, header)
    request.body = user.to_json

    # Send the request
    response = http.request(request)

    redirect_to "/favourites"
  end

end