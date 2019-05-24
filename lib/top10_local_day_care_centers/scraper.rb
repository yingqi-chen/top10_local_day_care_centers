
module Top10LocalDayCareCenters
  class Scraper

    




     # Place holders for Yelp Fusion's API key. Grab it
     # from https://www.yelp.com/developers/v3/manage_app



     # Constants, do not change these
     API_HOST = "https://api.yelp.com"
     SEARCH_PATH = "/v3/businesses/search"
     BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path
    
     SEARCH_LIMIT = 10
     

     # Make a request to the Fusion search endpoint. Full documentation is online at:
     # https://www.yelp.com/developers/documentation/v3/business_search
     #
     # term - search term used to find businesses
     # location - what geographic location the search should happen
     #
     # Examples
     #
     #   search("burrito", "san francisco")
     #   # => {
     #          "total": 1000000,
     #          "businesses": [
     #            "name": "El Farolito"
     #            ...
     #          ]
     #        }
     #
     #   search("sea food", "Seattle")
     #   # => {
     #          "total": 1432,
     #          "businesses": [
     #            "name": "Taylor Shellfish Farms"
     #            ...
     #          ]
     #        }
     #
     # Returns a parsed json object of the request
     def self.search(term, location)
       url = "#{API_HOST}#{SEARCH_PATH}"
       params = {
         term: term,
         location: location,
         limit: SEARCH_LIMIT,
         sort_by: "rating"

       }

       response = HTTP.auth("Bearer #{ENV['API_KEY']}").get(url, params: params)
       response.parse
     end
  end
end
