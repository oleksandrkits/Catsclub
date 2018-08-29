class ImagesController < ApplicationController
  def show
    url_search = 'https://api.thecatapi.com/v1/images/'

    resp = request_to_api(url_search + params['id'])

    if resp['message'].nil?
        url = resp['url']
    end


    respond_to do |format|
      format.json do
        render json: {
            id: params['id'],
            url: url
        }
      end
    end

  end
end