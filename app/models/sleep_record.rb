class SleepRecord < ApplicationRecord
  belongs_to :user

  scope :all_clock, -> {
    joins(:user).order(created_at: :desc)
  }
end
