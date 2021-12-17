Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json },
            controllers: {
                sessions: 'users/sessions',
                registrations: 'users/registrations'
            }
  get '/member-data', to: 'members#show', defaults: { format: :json }
  get '/logged_user', to: 'logged_users#index', defaults: { format: :json }
  get '/addresses', to: 'addresses#index', defaults: { format: :json }
  post '/address', to: 'addresses#create', defaults: { format: :json }
  delete '/addresses/:id', to: 'addresses#destroy', defaults: { format: :json }
  patch '/address/:id', to: 'addresses#update', defaults: { format: :json }
end