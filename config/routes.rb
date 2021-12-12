Rails.application.routes.draw do
  devise_for :users,
            controllers: {
                sessions: 'users/sessions',
                registrations: 'users/registrations'
            }
  get '/member-data', to: 'members#show'
  get '/logged_user', to: 'logged_users#index'
end