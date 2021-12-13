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
    end
  end
end
