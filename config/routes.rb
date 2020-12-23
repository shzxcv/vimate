Rails.application.routes.draw do
  root 'static_pages#top'
  get '/terms', to: 'static_pages#terms'
  get '/privacy', to: 'static_pages#privacy'
  get '/help', to: 'static_pages#help'
end
