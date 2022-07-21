class CreateQuizBranches < ActiveRecord::Migration[6.1]
  def change
    create_table :quiz_branches do |t|
      t.string :quiz_branch_name
      t.references :quiz, null: false, foreign_key: true

      t.timestamps
    end
  end
end
