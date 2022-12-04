# frozen_string_literal: true

class Player < ApplicationRecord
  validates :name, presence: true
  validates :sign, presence: true
  enum sign: { X: 0, O: 1 }.freeze

  def player_who_has_x_sign?
    sign == 'X'
  end

  def player_who_has_o_sign?
    sign == 'O'
  end
end
