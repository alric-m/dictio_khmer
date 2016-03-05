class QuestionsController < ApplicationController
  before_filter :get_quiz, only: [:edit, :update, :destroy]
  before_filter :get_question, only: [:edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render action: "new"
    end
  end

  def edit
    @word = @question.word
    @question_type = @question.question_type
    if @question_type.include?("kh_to")
      @word_definition = @word.definition_kh
    elsif @question_type.include?("fr_to")
      @word_definition = @word.definition_fr
    elsif @question_type.include?("en_to")
      @word_definition = @word.definition_en
    else
      @word_definition = @word.phonetic
    end
  end

  def update
    question_type = @question.question_type
    word = @question.word
    response = @question.response

    if question_type.include?("to_kh") && word.definition_kh == response ||
      question_type.include?("to_ph") && word.phonetic == response ||
      question_type.include?("to_fr") && word.definition_fr == response ||
      question_type.include?("to_en") && word.definition_en == response
      @question.result = true
    end
    @question.done = true


    if @question.update_attributes(question_params)
      if @quiz.next_question
        redirect_to edit_quiz_question_path(@quiz, @quiz.next_question.id)
      else
        redirect_to quiz_path(@quiz)
      end
    else
      render action: "edit"
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  private

    def get_quiz
      @quiz = Quiz.find(params[:quiz_id])
    end

    def get_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:quiz_id, :word_id, :question_type,
      :word_type, :themes, :response, :result, :finished)
    end

end
