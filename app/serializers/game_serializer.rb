# frozen_string_literal: true

class GameSerializer
  include JSONAPI::Serializer
  attributes :id, :winner, :move_count, :turn
  has_many :plays
end
