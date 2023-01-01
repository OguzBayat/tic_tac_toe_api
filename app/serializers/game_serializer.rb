# frozen_string_literal: true

class GameSerializer
  include JSONAPI::Serializer
  attributes :winner_id, :move_count, :turn, :player1_moves, :player2_moves
end
