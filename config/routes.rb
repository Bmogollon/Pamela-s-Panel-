Rails.application.routes.draw do
root 'pages#home'
resources :courses

resources :cohorts

resources :instructors
get '/register-instructor', to: 'student#new'

resources :students
get '/register-student', to: 'student#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
