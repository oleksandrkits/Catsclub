class ApplicationController < ActionController::Base

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

end
