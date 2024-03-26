require 'HTTParty'

request = HTTParty.get("https://api.github.com/users/mrkobo/repos")

most_stars = 0
most_starred_repo = []

request.each do |repo|
  if repo["stargazers_count"] >= most_stars
    most_stars = repo["stargazers_count"]
    most_starred_repo = most_starred_repo.push(repo["name"])
  end
end

puts "Hash(s) with most stars #{most_starred_repo}"

most_starred_repo.each do |name|
  request.each do |repo|
    if repo["name"] == name
      puts "Name: #{name} \nDescription: #{repo["description"]}\nNumber of Stars: #{repo["stargazers_count"]}\nURL: #{repo["url"]} "
    end
  end
end
