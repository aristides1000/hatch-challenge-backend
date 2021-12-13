require 'rails_helper'

RSpec.describe 'LoggedInUserController', type: :request do
  describe 'GET /users' do
    it 'let you log in with an existing username' do
      post '/users', params: { name: 'carmen', password: 'password', email: 'carmen@gmail.com' }
      post '/users/sign_in', params: { email: 'jose@gmail.com', password: 'password' }
      expect(JSON.parse(response.body)['message']).to eq("You are logged in.")
    end

    it 'let you log if user exist' do
      post '/users/sign_in', params: { username: 'jaar' }
      expect(JSON.parse(response.body)['code']).to eq(201)
    end
  end
end
