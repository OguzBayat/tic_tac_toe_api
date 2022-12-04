# frozen_string_literal: true

class Play < ApplicationRecord
  belongs_to :game
  belongs_to :player
end
