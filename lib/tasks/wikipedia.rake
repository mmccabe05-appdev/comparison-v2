
namespace :wikipedia do
  
  desc "TODO"
  task wikipedia: :environment do
    require "csv"
    require 'faker'
    require 'cgi'
    require 'open-uri'
    require 'wikipedia'
  p "Beginning WIKIPEDIA SUMMARY AND URL GRABBING"

  City.all.each do |a_city|
    begin 
    page = Wikipedia.find(a_city.name + ', ' + a_city.state)
    a_city.wiki_url = page.fullurl
    a_city.description = page.summary.truncate(1500,separator:' ')
    a_city.save
    rescue 
      puts "City wikipedia error for " + a_city.name
    end
  end

  Neighborhood.all.each do |a_neighborhood|
    begin 
    page = Wikipedia.find(a_neighborhood.name + ', ' + a_neighborhood.city.name)
    a_neighborhood.wiki_url = page.fullurl
    a_neighborhood.description = page.summary.truncate(1500,separator:' ')
    a_neighborhood.save
    rescue 
      puts "Neighborhood wikipedia error for" + a_neighborhood.name
    end
  end

  end
end
