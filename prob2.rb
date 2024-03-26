require 'HTTParty'

request = HTTParty.get("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd")

request.each do |hash|
  puts "Name: #{hash["name"]}\nCurrent Price: #{hash["current_price"]}\nMarket Capitalization: #{hash["market_cap"]}"
end

market_cap_list = []
request.each do |hash|
  market_cap_list = market_cap_list.push(hash["market_cap"])
end

desc_market_cap = market_cap_list.sort {|a, b| b <=> a}
puts desc_market_cap

top_5 = desc_market_cap.slice(0,5)

top_5.each do |market_cap|
  request.each do |repo|
    if repo["market_cap"] == market_cap
      puts "Name: #{repo["name"]} \nMarket Capitalization: #{market_cap}"
    end
  end
end
