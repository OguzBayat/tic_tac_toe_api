# frozen_string_literal: true

class PlaySerializer
  include JSONAPI::Serializer
  attributes :id, :game_id, :player_id, :moves
  belongs_to :game
  belongs_to :player
end
