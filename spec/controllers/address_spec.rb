require 'rails_helper'

RSpec.describe 'AddressesController', type: :request do
  describe "List a given user's addresses" do
    it "Returns the list of the user's reservations" do
      get '/addresses'
      expect(response).to_not have_http_status(:ok)
    end
  end
end
