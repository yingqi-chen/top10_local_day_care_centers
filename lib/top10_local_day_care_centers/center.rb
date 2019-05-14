module Top10LocalDayCareCenters


  class Center
    attr_accessor :phone_number,:address,:rating,:url,:name,:website, :id,:zip
    @@all={}

    def initialize(zip)
       #@zip=zip
       #find_or_create_by_zip with return an array and then anytime we need to push the object to where it belongs
       #right after it is born
      #self.class.find_or_create_by_zip <<self
    end

    def self.all
      @@all
    end

    #def self.find_or_create_by_zip(zip)
       #find within @@all to see if that zip is search before or not, if so, return that array
       #if not, set up a key for that.
       #self.all[zip]||=[]
    #end

    def self.get_centers_from_zip(zip)
        self.all[zip]=[]
        Scraper.scrape_from_zip(zip)#pushing center objects to self.all[zip] array
        self.all[zip]
    end

  end
end
