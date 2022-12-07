# frozen_string_literal: true

class GameSerializer
  include JSONAPI::Serializer
  attributes :winner, :move_count, :turn
  has_many :plays
end
