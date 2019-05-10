require 'pry'
module Top10LocalDayCareCenters


class Cli
  attr_accessor :zip,:input

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
      puts "valid!"#Scraper.scrape_from_zip
     else puts "The zip code you input must be 6-digit numbers!"
     puts ""
     call
     end
   end


























end
end
