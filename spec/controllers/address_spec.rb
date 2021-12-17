require 'rails_helper'

require 'rails_helper'
RSpec.describe "Addresses", type: :request do
  describe "/address" do
    before(:each) do
      post '/users', params: { :user => { name: "Daniel", email: "daniel@mail.com", password: "123456", password_confirmation: "123456" } }
      @token = 'Bearer ' + JSON.parse(response.body)['user']['token']
    end
    it "let you create new addresses" do
      post "/address",
      params: { street:"test", external_number: "test", internal_number: "test", postal_code: "12345", colony: "test",
      municipality: "test", city:"test", state:"test", country:"test" },
      headers: { Authorization: @token }
      expect(Address.all.length).to eq(1)
    end
    it "let you delete an address" do
      post "/address",
      params: { street:"test", external_number: "test", internal_number: "test", postal_code: "12345", colony: "test",
      municipality: "test", city:"test", state:"test", country:"test" },
      headers: { Authorization: @token }
      id = JSON.parse(response.body)['id']
      delete ("/addresses/" + id.to_s ), params: {}, headers: { Authorization: @token }
      expect(JSON.parse(response.body)["message"] == "Address successfully deleted").to eq(true)
      expect(Address.all.length).to be(0)
    end
    it "let you modify an address" do
      post "/address",
      params: { street:"test", external_number: "test", internal_number: "test", postal_code: "12345", colony: "test",
      municipality: "test", city:"test", state:"test", country:"test" },
      headers: { Authorization: @token }
      id = JSON.parse(response.body)['id']
      patch ("/address/" + id.to_s ), params: {street:"test2", external_number: "test2", internal_number: "test2",
      postal_code: "12345", colony: "test", municipality: "test", city:"test", state:"test", country:"test"},
      headers: { Authorization: @token }
      expect(Address.last['street'] == 'test2').to be(true)
    end
    it "get all addresses" do
      post "/address",
      params: { street:"test", external_number: "test", internal_number: "test", postal_code: "12345", colony: "test",
      municipality: "test", city:"test", state:"test", country:"test" },
      headers: { Authorization: @token }
      post "/address",
      params: { street:"test", external_number: "test", internal_number: "test", postal_code: "12345", colony: "test",
      municipality: "test", city:"test", state:"test", country:"test" },
      headers: { Authorization: @token }
      post "/address",
      params: { street:"test", external_number: "test", internal_number: "test", postal_code: "12345", colony: "test",
      municipality: "test", city:"test", state:"test", country:"test" },
      headers: { Authorization: @token }
      get "/addresses", headers: { Authorization: @token }
      expect(JSON.parse(response.body).length).to be(3)
    end
    it "List a given user's addresses" do
      get '/addresses'
      expect(response).to_not have_http_status(:ok)
    end
  end
end
