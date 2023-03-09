# == Schema Information
#
# Table name: comparisons
#
#  id                           :bigint           not null, primary key
#  body                         :string
#  built_environment_similarity :integer          default(0)
#  comments_count               :integer          default(0)
#  culinary_similarity          :integer          default(0)
#  downvotes                    :integer          default(0)
#  likes_count                  :integer          default(0)
#  net_comparison_score         :float            default(0.0)
#  net_votes                    :integer          default(0)
#  overall_similarity           :float            default(0.0)
#  people_similarity            :integer          default(0)
#  transportation_similarity    :integer          default(0)
#  upvotes                      :integer          default(0)
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  neighborhood_1_id            :integer          not null
#  neighborhood_2_id            :integer          not null
#  user_id                      :bigint           not null
#
# Indexes
#
#  index_comparisons_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Comparison < ApplicationRecord
  # belongs_to :user

  belongs_to(:user,  :required => true, :class_name => "User", :foreign_key => "user_id", :counter_cache => true )
  has_many(:likes,  :class_name => "Like", :foreign_key => "comparison_id", :dependent => :destroy )
  has_many(:comments,  :class_name => "Comment", :foreign_key => "comparison_id", :dependent => :destroy )
  belongs_to(:neighborhood_1,  :required => true, :class_name => "Neighborhood", :foreign_key => "neighborhood_1_id" )
  belongs_to(:neighborhood_2,  :required => true, :class_name => "Neighborhood", :foreign_key => "neighborhood_2_id" )

  has_many(:fans,  :through => :likes, :source => :user )
  has_one(:city_1,  :through => :neighborhood_1, :source => :city )
  has_one(:city_2,  :through => :neighborhood_2, :source => :city )


  validates :people_similarity, inclusion: { in: [0, 1, 2, 3, 4, 5], message: "select a valid similarity level"}
  validates :culinary_similarity, inclusion: { in: [0, 1, 2, 3, 4, 5], message: "select a valid similarity level"}
  validates :transportation_similarity, inclusion: { in: [0, 1, 2, 3, 4, 5], message: "select a valid similarity level"}
  validates :built_environment_similarity, inclusion: { in: [0, 1, 2, 3, 4, 5], message: "select a valid similarity level"}


  def similarity_levels_in_words
  
  end 

  validates(:user_id, :presence => true )
  validates(:neighborhood_1_id,  :presence => true, :allow_nil => false )
  validate :neighborhoods_cant_be_nil

  # validates :neighborhood_1_id, comparison: { other_than: :neighborhood_2_id }
  validate :neighborhoods_cant_match
  validate :cities_cant_match


  def neighborhoods_cant_match
    if self.neighborhood_1_id == self.neighborhood_2_id
      errors.add(:comparison, "Can't compare a neighborhoods to itself!")
    end
  end
  
  def neighborhoods_cant_be_nil
    if self.neighborhood_1_id.nil?
      errors.add(:comparison, "Must select a neighborhood 1!")
      return false
    elsif self.neighborhood_2_id.nil?
      errors.add(:comparison, "Must select a neighborhood 2!")
      return false
    else 
      return true
    end
  end

  def cities_cant_match
    if self.neighborhoods_cant_be_nil == true
      if Neighborhood.where(id: self.neighborhood_1_id).first.city_id == Neighborhood.where(id: self.neighborhood_2_id).first.city_id
        errors.add(:comparison, "Can't compare neighborhoods within the same city!")
      end
    else
    end 
  end

  validates(:neighborhood_2_id,  :presence => true )

end
