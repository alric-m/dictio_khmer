class UsersController < ApplicationController
  before_filter :get_user, only: [:show, :destroy]

  def index
    @users = Student.all
  end

  def show
    # @quizzes = @user.quizzes
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

    def get_user
      @user = User.find(params[:id])
    end

end
