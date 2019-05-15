module Top10LocalDayCareCenters


  class Center
    attr_accessor :phone_number,:address,:rating,:url,:name,:website, :id,:zip
    @@all={}

    def initialize
      
    end

    def self.all
      @@all
    end

    
    def self.get_centers_from_zip(zip)
        self.all[zip]=[]
        #pushing center objects to self.all[zip] array
        businesses=Scraper.search(term="day care",zip)["businesses"]
        binding.pry
        businesses.each do |business|
           center=Center.new
  #binding.pry
          center.id=business["id"]
          center.name=business["name"]
          center.address=business["location"]["display_address"][0]
          center.rating=business["rating"]
          center.url=business["url"]
          center.zip=business["location"]["zip_code"]
          center.phone_number=business["display_phone"]
          Center.all[zip]<<center
        end
        self.all[zip]
    end
    

  end
end
