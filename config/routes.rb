Rails.application.routes.draw do
  namespace :admins_backoffice do
    get 'welcome/index' #Dashboard
    resources :admins   #  Administradores  
    resources :subjects #  Assuntos/Areas
    resources :questions #  Perguntas

  end

  namespace :users_backoffice do
    get 'welcome/index'
  end

  namespace :site do
    get 'welcome/index'
    get 'search', to: 'search#questions'
    get 'subject/:subject_id/:subject', to: 'search#subject', as: 'search_subject'

    post 'answer', to: 'answer#question'  
  end

  devise_for :users
  devise_for :admins
  root to: 'site/welcome#index'
end