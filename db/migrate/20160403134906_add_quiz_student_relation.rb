class AddQuizStudentRelation < ActiveRecord::Migration
  def up
    add_column :quizzes, :student_id, :integer, index: true
  end

  def down
    remove_column :quizzes, :student_id
  end
end
