namespace :slurp do
  desc "TODO"
  task cities: :environment do
    require "csv"
    csv_text = File.read(Rails.root.join("lib", "csvs", "sample_data_cities.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    puts csv
    City.destroy_all
    p "All cities have been destroyed, there are now #{City.count} cities in the database"
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
    csv_text = File.read(Rails.root.join("lib", "csvs", "sample_data_neighborhoods.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    puts csv
    Neighborhood.destroy_all
    p "All neighborhoods have been destroyed, there are now #{Neighborhoods.count} cities in the database"
    p "filling in new cities"
    csv.each do |row|
      puts row.to_hash
      n = Neighborhood.new
      n.id = row["id"]
      n.city_id = row["city_id"]
      n.name = row["city_name"]
      n.description = Faker::
      n.save
      # puts "#{c.name} saved to database"
    end
    puts "There are now #{Neighborhood.count} rows in the City table"
  end

    
  

  task comparisons: :environment do


    
  end

end
