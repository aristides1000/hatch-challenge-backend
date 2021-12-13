require 'rails_helper'

RSpec.describe 'LoggedInUserController', type: :request do
  describe 'Reject the user without authentication or token' do
    it 'returns http success' do
      get '/logged_user', headers: { 'Accept': 'application/json', 'Content-Type': 'application/json' }
      expect(JSON.parse(response.body)['error'] == 'You need to sign in or sign up before continuing.').to be(true)
    end
  end
end