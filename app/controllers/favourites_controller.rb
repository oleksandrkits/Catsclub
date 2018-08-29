require 'net/http'
require 'json'

class FavouritesController < ApplicationController

  def index
    def request_to_api(url)
      @api_key = '3758c3ed-ad4f-4fa7-b181-746071587ee2'
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      header = {'Content-Type': 'application/json', 'x-api-key': @api_key}
      req = Net::HTTP::Get.new(uri, header)
      response = http.request(req)
      JSON.parse(response.read_body)
    end

    url_fav = 'https://api.thecatapi.com/v1/favourites/'
    url_search = 'https://api.thecatapi.com/v1/images/'
    @resp = request_to_api(url_fav)

    @resp.map! { |e| e['image_id'] }
    @urls =  []
    puts @resp
    @resp.each do |e|
      url = request_to_api(url_search + e.to_s)
      if url['message'].nil?
        @urls << url
      end
    end
  end

  def new
    @user_id = 'nfzh4j'
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

  def destroy
    @api_key = '3758c3ed-ad4f-4fa7-b181-746071587ee2'
    @user_id = 'nfzh4j'


    header = {'Content-Type': 'application/json',
              'x-api-key': @api_key
    }
    url = "https://api.thecatapi.com/v1/favourites/#{params['id']}"
    uri = URI("https://api.thecatapi.com/v1/favourites/#{params['id']}")

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Delete.new(url)
    request["Content-Type"] = 'application/json'
    request["x-api-key"] = @api_key
    response = http.request(request)
    puts 'hello'
    puts response.read_body
    puts 'hola'

    redirect_to "/favourites"

  end
end
