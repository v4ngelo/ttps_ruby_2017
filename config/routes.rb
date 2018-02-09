Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end

  resources :students
  resources :evaluations
  resources :courses
  resources :evaluation_results
  resources :evaluation_result_reports
  root to: redirect('/users/sign_in')

end
