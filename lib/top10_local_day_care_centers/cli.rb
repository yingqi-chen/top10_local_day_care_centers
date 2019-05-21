
module Top10LocalDayCareCenters
class Cli
  attr_accessor :center_array,:zip,:zip_array

def initialize
  @zip_array=[]
end


   def call
     puts "Hello! Welcome to top 10 local day care centers."
     puts "Here, by giving me a 5-digits zip code, I will return you the top 10 day care centers there！"
     puts "If you want to quit, please enter 'exit'."

     input=nil
     input=gets.strip
    #binding.pry

    if input.downcase=="exit"
      # to check if input is 5 digit and are all numbers, since string changed to number will be 0
    elsif input.length==5 && input.to_i !=0
      @zip=input #make zip an instance variable so I can use it in the second level of project, when people try to find out more  info
      #for another center that is from a same place (having a same zip code)
      get_centers
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
    if input.upcase=="Y"
         call
      elsif input.upcase=="N"
      else
     puts "Wrong input!"
     puts "Give me only 'Y' or 'N' please."
     ending
    end
   end

  def get_centers
  #this method is responsible to get info from the array return from scraper and turn data into readable formats
   #supposed to return an array of objects
  if  @zip_array.include?(@zip)
    @center_array=Center.all[@zip]
  else
    @center_array=Center.get_centers_from_zip(@zip)
    @zip_array<<@zip
  end
end

  def list_centers
     puts "" #just for a cleaner interface
    @center_array.each.with_index(1) do |center,i|
    puts "#{i}.#{center.name}  #{center.address}"
end
       specific_center
end


def specific_center
   puts ""
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
      puts ""
      ending_specific_page
 end

    def ending_specific_page
      puts "Do you want to know more information of other day care centers? [Y/N]"
      input=gets.strip
      if input.upcase=="Y"
        list_centers
      elsif input.upcase=="N"
      else
       puts "Wrong input!"
       puts "Give me only 'Y' or 'N' please."
       ending_specific_page
      end
     end

end
end
