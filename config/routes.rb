Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root to: 'words#index'
  get '/:locale' => 'words#index'

  scope "/:locale", locale: /fr|en/ do

    devise_for :users
    devise_for :students, :teachers, :skip => :sessions

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
