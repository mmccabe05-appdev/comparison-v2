
namespace :users do
  task add_users: :environment do
    require 'faker'
    require 'cgi'
    require 'open-uri'
    require 'wikipedia'
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

  end 


  task add_comments: :environment do
    Comparison.all.each do |a_comparison|
      rand(7..11).times do
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

  task add_favorite_neighborhoods: :environment do
    User.all.each do |user|
      rand(4..11).times do
        rand_id = rand(1..Neighborhood.count)

        new_favorite_neighborhood = FavoriteNeighborhood.create(
            neighborhood_id: rand_id,
            user_id: user.id,
          )
          p new_favorite_neighborhood.errors.full_messages
      end
    end
  end

end 
