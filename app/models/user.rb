class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many(:likes, { :class_name => "Like", :foreign_key => "user_id", :dependent => :destroy })
         has_many(:comments, { :class_name => "Comment", :foreign_key => "commenter_id", :dependent => :destroy })
         has_many(:comparisons, { :class_name => "Comparison", :foreign_key => "user_id", :dependent => :nullify })
         has_many(:favorite_neighborhoods, { :class_name => "FavoriteNeighborhood", :foreign_key => "user_id", :dependent => :destroy })
     
         has_many(:liked_comparisons, { :through => :likes, :source => :comparison })
         has_many(:liked_neighborhoods, { :through => :favorite_neighborhoods, :source => :neighborhood })
         validates(:username, { :presence => true })
         validates(:username, { :uniqueness => true }) # commit
end
