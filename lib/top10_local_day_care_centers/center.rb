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
        Scraper.scrape_from_zip(zip)#pushing center objects to self.all[zip] array
        self.all[zip]
    end

  end
end
