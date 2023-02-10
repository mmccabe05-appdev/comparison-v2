desc "Fill the database tables with some sample data"
task({ :sample_data => :environment}) do
  require 'faker'

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
    p u
    p u.errors.full_messages
  end

  p "#{User.count} users created"


end
