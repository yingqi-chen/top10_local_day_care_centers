module Top10LocalDayCareCenters


class Center
  attr_accessor :phone_number,:address,:rating,:url,:name,:website, :id,:zip,:matching_zip_codes
  @@all=[]

def initialize

end

def self.all
  @@all
end

def self.find_or_create(attributes_hash,zip)
  self.all.find { |object| object.id==attributes_hash[:id]}||self.create(attributes_hash,zip)
end

def self.create(hash,zip)
  center=Center.new
  center.id=hash["id"]
  center.name=hash["name"]
  center.address=hash["location"]["display_address"][0]
  center.rating=hash["rating"]
  center.url=hash["url"]
  center.zip=hash["location"]["zip_code"]
  center.phone_number=hash["display_phone"]
  center.matching_zip_codes=[zip]
  self.all<<center
  center
end

def self.get_centers_from_zip(zip)
  #talk to scraper to get data from it and should return array
  businesses=Scraper.search(term="day care",zip)["businesses"]
  businesses.collect do |business|
    if business.class==Hash
    Center.find_or_create(business,zip)
  end
end

end


end
end
