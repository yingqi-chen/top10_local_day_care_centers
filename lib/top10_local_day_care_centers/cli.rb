module Top10LocalDayCareCenters


class Cli
  attr_accessor :zip

  def initialize

  end

   def call
     puts "Hello! Welcome to top 10 local day care centers."
     puts "Here, by giving me a zip code, I will return you the top 10 day care centers there！"
     puts "Are you ready? Give me the 6-digit zip codes here, let's see what I have for you."
     puts "If you want to quit, please enter 'exit'."
   end


end
end
