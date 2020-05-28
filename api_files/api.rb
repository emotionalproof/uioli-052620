require 'net/http'
require 'open-uri'
require 'json'
class GetRequester

   APIKEY = 64dca65eeac74ce69073e6e23ff32ae9
  #  URL = https://api.spoonacular.com/recipes/716429/information?apiKey=#{APIKEY}&includeNutrition=true.

search by ingredients
https://api.spoonacular.com/recipes/findByIngredients?apiKey=64dca65eeac74ce69073e6e23ff32ae9&ingredients=tomato,onion,garlic&number=10&ranking=2

output.each do |recipe|
   Recipe.new(name: recipe["title"], search_id: recipe["id"])
end

cli to select to view recipe


output.map {|recipe| recipe[title]}

Ingredients





   def initialize(url)
      @url = url
   end
   
   def get_response_body
      #sends a GET request to the URL passed in on initialization. 
      # This method should return the body of the response.
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