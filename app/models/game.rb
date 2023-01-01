# frozen_string_literal: true

class Game < ApplicationRecord
  enum turn: { X: 0, O: 1 }.freeze
  belongs_to :winner, foreign_key: :winner_id, class_name: 'Player', optional: true
  has_many :plays

  after_commit :create_plays, on: :create
  after_commit :update_plays, on: :update

  def create_plays
    player1 = Player.where(sign: 'X').first
    player2 = Player.where(sign: 'O').first
    Play.create!(game: self, player: player1)
    Play.create!(game: self, player: player2)
  end

  def update_plays
    player1_play = plays.where(player_id: 1)
    player2_play = plays.where(player_id: 2)

    player1_play.update(moves: player1_moves)
    player2_play.update(moves: player2_moves)
    set_winner
  end

  private

  def set_winner
    if find_winner(plays.first) == 1
      update_columns(winner_id: 1)
    elsif find_winner(plays.last) == 2
      update_columns(winner_id: 2)
    end
  end

  def find_winner(play)
    moves = play.moves.freeze
    return if moves.count < 3

    moves_arr = play.moves.combination(3).to_a
    winning_numbers = WinningNumber.all.pluck(:numbers)

    winning_numbers.each do |wn|
      moves_arr.each do |ma|
        return play.player_id if wn.difference(ma).blank?
      end
    end
  end
end
