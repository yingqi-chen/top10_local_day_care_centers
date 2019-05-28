
module Top10LocalDayCareCenters
class Scraper
     # Constants, do not change these
    API_HOST = "https://api.yelp.com"
    SEARCH_PATH = "/v3/businesses/search"
    BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path
    SEARCH_LIMIT = 10

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
