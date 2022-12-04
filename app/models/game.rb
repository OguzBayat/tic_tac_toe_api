# frozen_string_literal: true

class Game < ApplicationRecord
  enum turn: { X: 0, O: 1 }.freeze
  belongs_to :winner, foreign_key: :winner_id, class_name: 'Player', optional: true
  has_many :plays

  after_commit :create_plays, on: :create

  def create_plays
    player1 = Player.where(sign: 'X').first
    player2 = Player.where(sign: 'O').first
    Play.create!(game: self, player: player1)
    Play.create!(game: self, player: player2)
  end
end
