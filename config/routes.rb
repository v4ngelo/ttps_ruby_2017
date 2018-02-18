Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end

  resources :courses do
  end
  resources :evaluations, controller: 'evaluations'
  resources :students, controller: 'students'
  resources :evaluation_results
  resources :evaluation_result_reports
  root to: redirect('/users/sign_in')

end
