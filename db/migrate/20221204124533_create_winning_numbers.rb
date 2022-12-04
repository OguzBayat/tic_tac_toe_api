class CreateWinningNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :winning_numbers do |t|
      t.integer :numbers, array: true, default: []

      t.timestamps
    end
  end
end
