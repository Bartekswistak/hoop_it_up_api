class Playercard < ApplicationRecord
    belongs_to :user 

    validates :player_nickname, :player_height_in_feet, :player_height_in_inches, :player_weight, :player_age, :player_fav_player, presence: true
end
