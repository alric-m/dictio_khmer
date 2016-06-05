class QuizzesController < ApplicationController
  before_filter :get_quiz, only: [:show, :destroy]

  def index
    @quizes = Quiz.all
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)

    if @quiz.save
      redirect_to edit_quiz_question_path(@quiz, @quiz.next_question)
    else
      render action: "new"
    end
  end

  def show
  end

  def destroy
    @quiz.destroy
    redirect_to quizzes_path
  end

  private

    def get_quiz
      @quiz = Quiz.find(params[:id])
    end

    def quiz_params
      params.require(:quiz).permit(:score, :timer, :questions_count,
      :default_question_type, :default_word_type, :default_themes, :done)
    end

end
