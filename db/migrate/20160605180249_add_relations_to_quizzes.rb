class AddRelationsToQuizzes < ActiveRecord::Migration
  def up
    add_column :quizzes, :student_id, :integer, index: true
    add_column :quizzes, :teacher_id, :integer, index: true
  end

  def down
    remove_column :quizzes, :student_id, :teacher_id
  end
end
