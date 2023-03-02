namespace :google_maps do
  desc "TODO"
  task google_maps: :environment do
    require 'faker'
    require 'cgi'
    require 'open-uri'
    require 'wikipedia'

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
        # p a_city.name + " GMAP URL: " + url
        # p "Lattitude baby? " + a_city.lat.to_s
      rescue NoMethodError
        p "a no Method error occurred"
      rescue 
        p "a city error occurred"
      end 
    end
  end 
end 
