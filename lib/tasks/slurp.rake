namespace :slurp do
  desc "TODO"
  task cities: :environment do
    require "csv"
    puts "removing all previous cities from database"
    City.destroy_all
    p "All cities have been destroyed, there are now #{City.count} cities in the database"

    puts "importing cities csv......"
    csv_text = File.read(Rails.root.join("lib", "csvs", "sample_data_cities.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    puts "displaying imported csv......"
    puts csv
 
    p "filling in new cities"
    csv.each do |row|
      # puts row.to_hash
      c = City.new
      c.id = row["id"]
      c.location = row["location"]
      c.name = row["city_name"]
      c.save
      puts "#{c.name} saved to database"
    end
    puts "There are now #{City.count} rows in the City table"
  end

  task neighborhoods: :environment do
    require "csv"
    p "removing all previous neighborhoods in table......"
    Neighborhood.destroy_all
    p "All neighborhoods have been destroyed, there are now #{Neighborhood.count} cities in the database"
    csv_text = File.read(Rails.root.join("lib", "csvs", "sample_data_neighborhoods.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    p "importing csv, here is all the data in the csv....."
    puts csv

    p "loading into the database filling in new cities..........."
    csv.each do |row|
      n = Neighborhood.new
      n.id = row["id"]
      n.city_id = row["city_id"]
      n.name = row["name"]
      n.description = Faker::Lorem.paragraph(sentence_count: 5)
      n.save
      puts "#{n.name} saved to database"
    end
    puts "There are now #{Neighborhood.count} rows in the Neighborhood table"
  end

    
  

  task comparisons: :environment do


    
  end

end
