require 'net/http'
require 'open-uri'
require 'json'
class GetRequester

   #APIKEY = 64dca65eeac74ce69073e6e23ff32ae9

   def initialize(url)
      @url = url
   end
   
   def get_response_body
      uri = URI.parse(@url)
      response = Net::HTTP.get_response(uri)
      response.body
   end

   def parse_json
      JSON.parse(self.get_response_body)
   end

  # def get_programs
  #   uri = URI.parse(URL)
  #   response = Net::HTTP.get_response(uri)
  #   response.body
  # end

  # def program_school
  #   programs = JSON.parse(self.get_programs)
  #   programs.collect do |program|
  #     program["agency"]
  #   end
  # end


end