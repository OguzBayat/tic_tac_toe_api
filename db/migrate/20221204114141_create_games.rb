class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer :winner_id, null: true
      t.integer :move_count, default: 0
      t.integer :turn, null: false, default: 0

      t.timestamps
    end
  end
end
