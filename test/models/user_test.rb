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
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
