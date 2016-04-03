class StudentsController < ApplicationController
  before_filter :get_student, only: [:show, :destroy]

  def index
    @students = Student.all
  end

  def show
    @quizzes = @student.quizzes
  end

  def destroy
    @student.destroy
    redirect_to students_path
  end

  private

    def get_student
      @student = Student.find(params[:id])
    end

end
