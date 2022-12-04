# frozen_string_literal: true

class WinningNumber < ApplicationRecord
  serialize :numbers
  after_initialize do |b|
    b.numbers = [] if b.numbers.nil?
  end
end
