require 'pry'
module Top10LocalDayCareCenters


class Cli
  attr_accessor :center_array,:zip

   def call
     puts "Hello! Welcome to top 10 local day care centers."
     puts "Here, by giving me a 5-digits zip code, I will return you the top 10 day care centers there！"
     puts "If you want to quit, please enter 'exit'."

     input=nil
     input=gets.strip
    #binding.pry

    if input.downcase=="exit"
    elsif input.length==5 && input.to_i !=0
      @zip=input# to check if input is 5 digit and are all numbers, since string changed to number will be 0
      list_centers
      puts ""#just for a cleaner interface
    else puts "The zip code you input must be 5-digit numbers!"
     puts ""
     call
     end
   ending
  end

  def ending

    puts "Do you want to re-enter a zip code? [Y/N]"
    input=gets.strip
    #binding.pry
    while !["Y","N"].include?(input.upcase)
     puts "Wrong input!"
     puts "Give me only 'Y' or 'N' please."
     ending
    end

   if input.upcase=="Y"
        call
     else
     end
   end

  def specific_center
     puts "Tell me which place you are interested in?"
     puts "Or enter 'exit' to leave."
     input=nil
     input=gets.strip
     if input=="exit"
       elsif input.to_i>0 && input.to_i<=@center_array.size
         specific_center_page(input)
       else puts "Sorry, it is not a valid input!"
        specific_center
     end
   end



   def list_centers
  #this method is responsible to get info from the array return from scraper and turn data into readable formats
    @center_array=Scraper.scrape_from_zip(@zip)
     #supposed to return an array of objects
     puts "" #just for a cleaner interface
    @center_array.each.with_index(1) do |center,i|
    puts "#{i}.#{center.name}  #{center.address}"
end
       specific_center
end

   def specific_center_page(index)
    #this method is responsible to get info from the object return from scraper and turn data into readable formats
     if @center_array[index.to_i-1].class==Center
    center=@center_array[index.to_i-1]
    end

     puts "#{center.name}'s more infomation:"
     puts "Rating: #{center.rating}"

      if center.phone_number
      puts "Phone number: #{center.phone_number}"
      end

      if center.url
      puts "Yelp page: #{center.url}"
      end
      ending_specific_page
 end

    def ending_specific_page
      puts "Do you want to know more information of other day care centers? [Y/N]"
      input=gets.strip
      while !["Y","N"].include?(input.upcase)
       puts "Wrong input!"
       puts "Give me only 'Y' or 'N' please."
       ending_specific_page
      end

     if input.upcase=="Y"
       list_centers
       else
       end
     end
























end
end
