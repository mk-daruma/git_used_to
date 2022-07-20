class CreateQuizCommandTags < ActiveRecord::Migration[6.1]
  def change
    create_table :quiz_command_tags do |t|
      t.string :quiz_command_tag_name
      t.references :quiz, null: false, foreign_key: true

      t.timestamps
    end
  end
end
