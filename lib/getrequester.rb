require 'net/http'
require 'open-uri'
require 'json'

 #APIKEY = 64dca65eeac74ce69073e6e23ff32ae9

class GetRequester

   def initialize(url, items = nil, website_id = nil)
      @url = url
      @items = items
      @website_id = website_id
   end
   
   def get_response_body
      uri = URI.parse(@url)
      response = Net::HTTP.get_response(uri)
      response.body
   end

   def parse_json
      JSON.parse(self.get_response_body)
   end
   
end