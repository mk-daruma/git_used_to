class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|
      t.string :quiz_name
      t.text :quiz_introduction
      t.string :quiz_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
