require 'HTTParty'

request = HTTParty.get("http://worldtimeapi.org/api/timezone/America/Maceio")

current_date_time = request["datetime"]
puts current_date_time


puts "The current time in #{request["timezone"]} is #{request["datetime"].slice(11,8)} on #{request["datetime"].slice(0,10)}"
