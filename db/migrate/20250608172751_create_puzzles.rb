class CreatePuzzles < ActiveRecord::Migration[8.0]
  def change
    create_table :puzzles do |t|
      t.json :cards
      t.date :date

      t.timestamps
    end
  end
end
