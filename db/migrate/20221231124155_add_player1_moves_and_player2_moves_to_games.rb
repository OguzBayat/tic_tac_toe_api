class AddPlayer1MovesAndPlayer2MovesToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :player1_moves, :integer, array: true, default: []
    add_column :games, :player2_moves, :integer, array: true, default: []
  end
end
