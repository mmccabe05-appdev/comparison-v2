desc "Fill the database tables with some sample data"
task({ :sample_data => :environment}) do
  require 'faker'

  p "Initiating sample data"
  p "removing previously created users"
  # add in if/then statement for development only and not all data  
  User.destroy_all
  p "creating users"
  # test user
  user = User.new
  user.username = "test"

  10.times do |user|
    user = User.new
    user.username = Faker::Internet.username
    user.email = Faker::Internet.email
    p user
    user.save
  end
  p User.count
end
