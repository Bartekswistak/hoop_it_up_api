class PlayercardSerializer < ActiveModel::Serializer
    attributes :id, :player_nickname, :player_height_in_feet, :player_height_in_inches, :player_weight, :player_age, :player_fav_player

    belongs_to :user
  end