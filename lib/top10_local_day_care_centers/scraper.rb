module Top10LocalDayCareCenters


  class Scraper

     def self.scrape_from_zip(zip)
        center1=Center.new
        center1.name="hello"
        center1.address="123 Boardway, CO"
        center1.url="https://www.yelp.com/biz/la-petite-academy-of-lakewood-lakewood"

        center2=Center.new
        center2.name="world"
        center2.address="456 Boardway, CO"
        center2.url="https://www.yelp.com/biz/ikid-academy-aurora"

        [center1,center2]
     end

     def self.scrape_from_url(center)
        #designed to get deeper message like the phone number, website and rating
        center.phone_number="12345678"
        center.website="......."
        center.rating="4.5"
        center
     end

  end
end
