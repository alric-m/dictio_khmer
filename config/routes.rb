Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root to: 'words#index'
  get '/:locale' => 'words#index'

  scope "/:locale", locale: /fr|en/ do

    devise_for :users, skip: [:registrations]
    devise_for :students, :teachers, :skip => :sessions

    # routes for all users
    authenticated :user do
    end

    # routes only for students
    authenticated :student, lambda {|u| u.type == "Student"} do
    end

    # routes only for teachers
    authenticated :teacher, lambda {|u| u.type == "Teacher"} do
    end

    resources :students
    resources :teachers

    resources :words do
      collection do
        get :fr_tags, as: :fr_tags
        get :en_tags, as: :en_tags
      end
    end

    resources :quizzes do
      resources :questions
    end

  end

end
