require 'net/http'
require 'json'

class FavouritesController < ApplicationController

  def index
    @api_key = '3758c3ed-ad4f-4fa7-b181-746071587ee2'
    @user_id = 'nfzh4j'

    @url_fav = 'https://api.thecatapi.com/v1/favourites/'
    @url_search = 'https://api.thecatapi.com/v1/images/'


    puts "URL FAV IS: #{@url_fav}"
    @resp = request_to_api(@url_fav)
    puts @resp
    @resp.map! { |e| [e['image_id'], e['id'] ]}
    @urls =  []

    @resp.each do |e|
      url = request_to_api(@url_search + e[0].to_s)
      if url['message'].nil?
        @urls << url
      end
    end

  end

  def create

    @api_key = '3758c3ed-ad4f-4fa7-b181-746071587ee2'
    @user_id = 'nfzh4j'

    @url_fav = 'https://api.thecatapi.com/v1/favourites/'
    @url_search = 'https://api.thecatapi.com/v1/images/'

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

    @url_fav = 'https://api.thecatapi.com/v1/favourites/'
    @url_search = 'https://api.thecatapi.com/v1/images/'

    header = {'Content-Type': 'application/json',
              'x-api-key': @api_key
    }
    url = "https://api.thecatapi.com/v1/favourites/#{params['id']}"
    uri = URI(url)

    puts 'hello'
    puts 'bye'

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
