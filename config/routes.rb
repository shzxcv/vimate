Rails.application.routes.draw do
  #StaticPages
  root 'static_pages#top'
  get 'terms', to: 'static_pages#terms'
  get 'privacy', to: 'static_pages#privacy'
  get 'help', to: 'static_pages#help'

  #Users
  resources :users, only: %i[new create edit update], param: :name
  resources :password_resets, only: %i[new create edit update]
  get 'mypage', to: 'users#show'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback"
  get "oauth/:provider" => "oauths#oauth", as: :auth_at_provider

  #Lessons
  resources :lessons, only: %i[index show], param: :url do
    resources :commands, only: %i[index]
  end

  #UserLessons
  resources :user_lessons, only: %i[create]

  #Inquiries
  resources :inquiries, only: %i[new create]

  #Mailer
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
