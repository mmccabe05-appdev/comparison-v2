desc "Fill the database tables with some sample data"
require 'uri'

task({ :comparisons_and_comments => :environment}) do

  if Rails.env.development?
    p "destroying previous data"
    Like.destroy_all
    p "#{Like.count} likes remain"
    Comment.destroy_all
    p "#{Comment.count} comments remain"

    Comparison.destroy_all
    p "#{Comparison.count} comparisons remain"

    FavoriteNeighborhood.destroy_all
    p "#{FavoriteNeighborhood.count} favorites favorites remain"


  end 

  # Rake::Task["users:add_users"].execute
  Rake::Task["slurp:comparisons"].execute
  Rake::Task["users:add_comments"].execute
  Rake::Task["users:add_bios"].execute
  Rake::Task["users:add_favorite_neighborhoods"].execute



end



task({ :all_sample_data => :environment}) do
  require 'faker'
  require 'cgi'
  require 'open-uri'
  require 'wikipedia'

  p "Initiating full scale sample data rewrite"

  if Rails.env.development?
    p "destroying previous data"
    Like.destroy_all
    p "#{Like.count} likes remain"
    Comment.destroy_all
    p "#{Comment.count} comments remain"

    Comparison.destroy_all
    p "#{Comparison.count} comparisons remain"

    FavoriteNeighborhood.destroy_all
    p "#{FavoriteNeighborhood.count} fav neighborhood favorites remain"


  end 

  Rake::Task["users:refresh_users"].execute

  Rake::Task["slurp:cities"].execute
  Rake::Task["slurp:neighborhoods"].execute
  Rake::Task["slurp:add_name_with_city"].execute

  Rake::Task["google_maps:google_maps"].execute
  Rake::Task["wikipedia:cities"].execute
  Rake::Task["wikipedia:neighborhoods"].execute


  Rake::Task["slurp:comparisons"].execute
  Rake::Task["users:add_comments"].execute
end 
