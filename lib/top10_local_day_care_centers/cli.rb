require 'pry'
module Top10LocalDayCareCenters


class Cli
  attr_accessor :center_array

   def call
     puts "Hello! Welcome to top 10 local day care centers."
     puts "Here, by giving me a zip code, I will return you the top 10 day care centers there！"
     puts "Are you ready? Give me the 6-digit zip codes here, let's see what I have for you."
     puts "If you want to quit, please enter 'exit'."

     input=nil
     input=gets.strip
    #binding.pry
    if input.downcase=="exit"
    elsif input.length==5 && input.to_i !=0
      list_centers(input)#Scraper.scrape_from_zip #we will change this part later
      specific_center
    else puts "The zip code you input must be 5-digit numbers!"
     puts ""
     call
     end
end

 def specific_center
     puts "Tell me which place you are interested in?"
     puts "Or enter 'exit' to leave."
     input=nil
     input=gets.strip
     if input.to_i>0 && input.to_i<=@center_array.size
      puts "we are going to scrape the specific center page!"
    else puts "Sorry, it is not a valid input!"
      specific_center
   end
 end

def list_centers(zip)
  #this method is responsible to get info from hash and turn data into readable formats
@center_array=Scraper.scrape_from_zip(zip) #supposed to return an array of objects
@center_array.each.with_index(1) do |center,i|
    puts "#{i}.#{center.name} #{center.rating} #{center.address}"
end
end

























end
end
