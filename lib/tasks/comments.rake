
namespace :comments do
  
  desc "Adds lorem ipsum comments"
  task add_comments: :environment do
    
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
end 
