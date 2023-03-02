desc "Fill the database tables with some sample data"
require 'uri'

task({ :sample_data => :environment}) do
  require 'faker'
  require 'cgi'
  require 'open-uri'
  require 'wikipedia'


  p "Initiating sample data"

  if Rails.env.development?
    p "destroying previous data"
    Like.destroy_all
    p "#{Like.count} likes remain"
    Comment.destroy_all
    p "#{Comment.count} comments remain"

    Comparison.destroy_all
    p "#{Comparison.count} comparisons remain"

    User.destroy_all
    p "#{User.count} users remain"

  end 

  p "creating users"
  # test user
  # user = User.new
  # user.username = "test"
  # user.email = "test@test.com"
  # user.password = "password"
  # p user
  # user.save

  usernames = Array.new { Faker::Name.first_name }

  usernames << "matt"
  usernames << "alice"
  usernames << "test"
  10.times do |username|
    usernames << Faker::Name.first_name
  end
  id_count = 0
  usernames.each do |username|
    name = Faker::Name.first_name
    id_count = id_count + 1
    u = User.create(
      id: id_count,
      email: "#{username}@example.com",
      username: username.downcase,
      password: "password",
    )
    # p u
    p u.errors.full_messages
  end

  p "#{User.count} users created"

  # Want to load the other pieces of the database once 
  # Rake:slurp:cities
  # Rake:slurp:neighborhoods
  # Rake:slurp:comparisons

  Rake::Task["slurp:cities"].execute
  Rake::Task["slurp:neighborhoods"].execute
  Rake::Task["slurp:comparisons"].execute

  # update each neighborhood lat and lng with googleMaps API
  Neighborhood.all.each do |a_neighborhood|
    begin
    placeholder = a_neighborhood.name.tr('\'', '') + ", " + a_neighborhood.city.name
    map_name = CGI.escape(placeholder)
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{map_name}&key=" + ENV.fetch("GMAPS_KEY")
    raw_data = URI.open(url).read
    parsed_data = JSON.parse(raw_data)                                                           
    f = parsed_data.fetch("results").at(0)
    a_neighborhood.lat = f.fetch("geometry").fetch("location").fetch("lat").to_f
    a_neighborhood.lng = f.fetch("geometry").fetch("location").fetch("lng").to_f

    a_neighborhood.save
    p a_neighborhood.name + " GMAP URL: " + url
    p "Lattitude baby? " + a_neighborhood.lat.to_s
    rescue OpenURI::HTTPError => ex
      puts a_neighborhood.name.tr('\'', '') + "caused an error"
     
    rescue NoMethodError
      p "another error occurred"
    end
  end
puts "ADDING LAT AND LONG FOR CITIES"
  City.all.each do |a_city|
    begin
    placeholder = a_city.name
    map_name = CGI.escape(placeholder)
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{map_name}&key=" + ENV.fetch("GMAPS_KEY")
    raw_data = URI.open(url).read
    parsed_data = JSON.parse(raw_data)                                                           
    f = parsed_data.fetch("results").at(0)
    a_city.lat = f.fetch("geometry").fetch("location").fetch("lat").to_f
    a_city.lng = f.fetch("geometry").fetch("location").fetch("lng").to_f

    a_city.save
    p a_city.name + " GMAP URL: " + url
    p "Lattitude baby? " + a_city.lat.to_s
    rescue NoMethodError
      p "a no Method error occurred"
    rescue 
      p "a city error occurred"
    end 
  end

  City.all.each do |a_city|
    begin 
    page = Wikipedia.find(a_city.name + ', ' + a_city.state)
    a_city.wiki_url = page.fullurl
    a_city.description = page.summary.truncate(1500,separator:' ')
    a_city.save
    rescue 
      puts "City wikipedia error for " + a_city
    end
  end

  Neighborhood.all.each do |a_neighborhood|
    begin 
    page = Wikipedia.find(a_neighborhood.name + ', ' + a_neighborhood.city.name)
    a_neighborhood.wiki_url = page.fullurl
    a_neighborhood.description = page.summary.truncate(1500,separator:' ')
    a_neighborhood.save
    rescue 
      puts "Neighborhood wikipedia error for" + a_neighborhood
    end
  end

  Comparison.all.each do |a_comparison|
    rand(3..7).times do
      rand_id = rand(1..User.count)

      new_comment = Comment.create(
          comparison_id: a_comparison.id,
          commenter_id: rand_id,
          body: Faker::Lorem.paragraph(sentence_count: 3)
        )
        # p new_comment
        p new_comment.errors.full_messages
      end
  end

end
