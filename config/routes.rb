Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root to: 'words#index'
  get '/:locale' => 'words#index'

  scope "/:locale" do

    resources :words do
      collection do
        get :tags, as: :tags
      end
    end

    resources :quizzes do
      resources :questions
    end

  end

end
