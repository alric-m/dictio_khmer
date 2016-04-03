class AddTimestampsToQuizzesAndQuestions < ActiveRecord::Migration
  def up
    change_table :quizzes do |t|
      t.timestamps null: false
    end

    change_table :questions do |t|
      t.timestamps null: false
    end
  end

  def down
    remove_column :quizzes, :created_at
    remove_column :quizzes, :updated_at
    remove_column :questions, :created_at
    remove_column :questions, :updated_at
  end
end
