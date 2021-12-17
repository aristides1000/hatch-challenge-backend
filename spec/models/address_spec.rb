require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'Validations' do
    describe 'street' do
      it 'is must be present' do
        address = described_class.new
        expect(address).to_not be_valid
      end

      it 'is to be string' do
        address = described_class.new
        address.street = 'independencia'
        expect(address).to_s
      end

      it 'is not valid without a description' do
        address = described_class.new
        address.colony = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid without an image url' do
        address = described_class.new
        address.city = nil
        expect(address).to_not be_valid
      end

      it 'user has many addresses' do
        user = User.create(name:"jaar", email:"jaar@gmail.com", password:"password")
        user.addresses.create(street:"test", external_number: "test", internal_number: "test", postal_code: "12345", colony: "test",
        municipality: "test", city:"test", state:"test", country:"test" )
        expect(Address.all.length).to eq(1)
        expect(user.addresses.length).to eq(1)
       end
    end
  end
end
