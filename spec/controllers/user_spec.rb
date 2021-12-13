require 'rails_helper'

=begin
RSpec.describe 'LoggedInUserController', type: :request do
  describe 'GET /users' do
    it 'let you log in with an existing username' do
      post '/users', params: {"name": "Daniel", "email": "daniel@mail.com", "password": "123456", "password_confirmation": "123456"}
      p JSON.parse(response.body)
      expect(User.all.length > 0).to be(true)

      # post '/users/sign_in', params: {"user": {"email": "daniel@mail.com", "password": "123456"}}
      # expect(JSON.parse(response.body)['message']).to eq("You are logged in.")
    end
=end

=begin
    it 'let you log if user exist' do
      post '/users/sign_in', params: {"user": {"email": "daniel@mail.com", "password": "123456"}}
      expect(JSON.parse(response.body)['code']).to eq(201)
    end
=end

=begin
  end
end
=end

RSpec.describe 'LoggedInUserController', type: :request do
  let!(:user) { create(:user) }

  describe 'User sign up' do
    let!(:user) { create(:user) }

    it 'Succeeds for a new user name' do
      headers = {
        'HTTP_ACCEPT' => 'application/json'
      }
      post '/users', params: { user:
                                { name: 'John Snow',
                                  email: 'john@example.com',
                                  password: '123456',
                                  password_confirmation: '123456' } },
                     headers: headers

      expect(response).to have_http_status(200)
    end

    it 'success and valid email' do
      headers = {
        'HTTP_ACCEPT' => 'application/json'
      }
      post '/users', params: { user: { name: user.email } },
                     headers: headers

      expect(response).to have_http_status(200)
    end
  end
end
