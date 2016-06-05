class CreateQuizzes < ActiveRecord::Migration
  def up
    create_table :quizzes do |t|
      t.integer  :score
      t.integer  :timer
      t.integer  :questions_count
      t.string   :translate_from_default
      t.string   :translate_to_default
      t.string   :default_word_type
      t.string   :default_tags
      t.boolean  :done
      t.timestamps null: false
    end

    create_table :questions do |t|
      t.belongs_to :quiz
      t.belongs_to :word
      t.string     :translate_from
      t.string     :translate_to
      t.string     :response
      t.string     :answer
      t.boolean    :result, default: false
      t.boolean    :done, default: false
      t.timestamps null: false
    end
  end

  def down
    drop_table :quizzes
    drop_table :questions
  end
end
