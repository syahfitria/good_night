class User < ApplicationRecord
  has_many :sleep_records
  has_many :user_followers
end
