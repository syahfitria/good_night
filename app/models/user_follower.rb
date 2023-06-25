class UserFollower < ApplicationRecord
  belongs_to :user
  belongs_to :user_follower, class_name: "User", optional: true
end
