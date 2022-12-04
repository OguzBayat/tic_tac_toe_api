# frozen_string_literal: true

class Game < ApplicationRecord
  enum turn: { X: 0, O: 1 }.freeze
  belongs_to :winner, foreign_key: :winner_id, class_name: 'Player', optional: true
end
