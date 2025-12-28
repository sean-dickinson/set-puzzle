class CreatePuzzleCompletions < ActiveRecord::Migration[8.1]
  def change
    create_table :puzzle_completions do |t|
      t.datetime :start_time, comment: "when the user started the puzzle according to the frontend"
      t.datetime :end_time, comment: "when the user finished the puzzle according to the frontend"
      t.json :sets, comment: "the sets of cards in the order the user solved them"
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :puzzle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
