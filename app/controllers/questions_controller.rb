class QuestionsController < ApplicationController
  before_filter :get_quiz, only: [:edit, :update, :destroy]
  before_filter :get_question, only: [:edit, :update, :destroy]

  def edit
    @word = @question.word
    @translate_from = @question.translate_from
    @translate_to = @question.translate_to
    @word_definition = @word.definition(@translate_from)
  end

  def update
    @question.response = params[:question][:response]
    @question.result = true if @question.response.downcase == @question.answer.downcase
    @question.done = true

    if @question.update_attributes(question_params)
      if @quiz.next_question
        redirect_to edit_quiz_question_path(@quiz, @quiz.next_question.id)
      else
        @quiz.correct!
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
      params.require(:question).permit(:quiz_id, :word_id, :translate_from,
      :translate_to, :word_type, :themes, :response, :result, :finished)
    end

end
