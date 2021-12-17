require 'rails_helper'

RSpec.describe 'LoggedInUserController', type: :request do
  describe 'GET /users' do
    it 'let you create a new user' do
      post '/users', params: { :user => { name: "Daniel", email: "daniel@mail.com", password: "123456", password_confirmation: "123456" } }
      expect(User.all.length).to be(1)
      expect(JSON.parse(response.body)['message'] == 'Signed up sucessfully.').to be(true)
    end
    it 'only one email per account' do
      post '/users', params: { :user => { name: "Daniel", email: "daniel@mail.com", password: "123456", password_confirmation: "123456" } }
      post '/users', params: { :user => { name: "jaar", email: "daniel@mail.com", password: "123456", password_confirmation: "123456" } }
      expect(User.all.length).to be(1)
    end
    it 'let you log if user exist' do
      post '/users', params: { :user => { name: "Daniel", email: "daniel@mail.com", password: "123456", password_confirmation: "123456" } }
      post '/users/sign_in', params: { user: {"email": "daniel@mail.com", "password": "123456"}}
      expect(JSON.parse(response.body)['message'] == "You are logged in.").to eq(true)
    end
    it 'Reject the user without authentication or token' do
      get '/logged_user', headers: { 'Accept': 'application/json', 'Content-Type': 'application/json' }
      expect(JSON.parse(response.body)['error'] == 'You need to sign in or sign up before continuing.').to be(true)
    end
  end
end