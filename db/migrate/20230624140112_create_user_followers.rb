class CreateUserFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :user_followers do |t|
      t.references :user
      t.references :follower
      t.timestamps
    end
  end
end
