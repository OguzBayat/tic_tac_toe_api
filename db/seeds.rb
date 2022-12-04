# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Creates the 2 players required for the game
Player.create(name: 'Player1')
Player.create(name: 'Player2', sign: 1)
puts('players are created')

# initial a game beacause when app starts user should see a game
Game.create() # It can be removed according to the decision on the front end
puts('game is created.')

# creation of indexes that will win the game
arr = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

ActiveRecord::Base.transaction do
  arr.each do |a|
    WinningNumber.create(numbers: a)
  end
  puts('Required values for the game are set.')
end
