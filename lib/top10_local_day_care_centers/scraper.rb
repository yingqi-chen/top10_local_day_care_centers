module Top10LocalDayCareCenters


  class Scraper

     def self.scrape_from_zip(zip)
        center1=Center.new
        center1.name="hello"
        center1.rating="4.5"
        center1.address="123 Boardway, CO"
        center2=Center.new
        center2.name="world"
        center2.rating="3.0"
        center2.address="456 Boardway, CO"
        [center1,center2]
     end

  end
end
