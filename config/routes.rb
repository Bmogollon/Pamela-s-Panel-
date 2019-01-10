Rails.application.routes.draw do
  resources :todos
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
   post   '/login',   to: 'sessions#create'
   delete '/logout',  to: 'sessions#destroy'

 root 'pages#home'

resources :admins

resources :courses

resources :cohorts
get '/register-cohort', to: 'cohort#new'
get '/show', to: 'cohort#show'

resources :instructors
get '/register-instructor', to: 'instructor#new'

resources :students
get '/register-student', to: 'student#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
