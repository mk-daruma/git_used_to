class CreateQuizReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :quiz_reviews do |t|
      t.float :quiz_review
      t.references :quiz, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
