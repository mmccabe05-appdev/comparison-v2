# == Schema Information
#
# Table name: users
#
#  id                           :bigint           not null, primary key
#  comparisons_count            :integer          default(0)
#  email                        :citext           default(""), not null
#  encrypted_password           :string           default(""), not null
#  favorite_neighborhoods_count :integer          default(0)
#  remember_created_at          :datetime
#  reset_password_sent_at       :datetime
#  reset_password_token         :string
#  username                     :citext
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many(:likes, :class_name => "Like", :foreign_key => "user_id", :dependent => :destroy )
         has_many(:comments, :class_name => "Comment", :foreign_key => "commenter_id", :dependent => :destroy )
         has_many(:comparisons, :class_name => "Comparison", :foreign_key => "user_id", :dependent => :nullify )
         has_many(:favorite_neighborhoods, :class_name => "FavoriteNeighborhood", :foreign_key => "user_id", :dependent => :destroy )
     
         has_many(:liked_comparisons, :through => :likes, :source => :comparison )
         has_many(:liked_neighborhoods, :through => :favorite_neighborhoods, :source => :neighborhood )
         validates(:username, :presence => true )
         validates(:username, :uniqueness => true )
end
