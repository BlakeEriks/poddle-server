class CreateUsersGenresJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :genres
  end
end
