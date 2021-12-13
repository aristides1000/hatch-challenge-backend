Rails.application.routes.draw do
  devise_for :users,
            controllers: {
                sessions: 'users/sessions',
                registrations: 'users/registrations'
            }
  get '/member-data', to: 'members#show'
  get '/logged_user', to: 'logged_users#index'

  get '/addresses', to: 'addresses#index'
  post '/address', to: 'addresses#create'
  delete '/addresses/:id', to: 'addresses#destroy'
  patch '/address/:id', to: 'addresses#update'
end