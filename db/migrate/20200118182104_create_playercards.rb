class CreatePlayercards < ActiveRecord::Migration[5.2]
  def change
    create_table :playercards do |t|
      t.string :player_nickname
      t.integer :player_height_in_inches
      t.integer :player_height_in_feet
      t.integer :player_weight
      t.integer :player_age
      t.string :player_fav_player
      t.integer :user_id
      
      t.timestamps
    end
  end
end
