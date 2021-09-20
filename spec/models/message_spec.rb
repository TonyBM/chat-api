require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'Validations' do 
    context 'Prescence' do
      it { is_expected.to validate_presence_of(:participant) }
    end

    context 'save' do
      let(:message) { FactoryBot.build(:message) }
      it 'persisted' do
        expect(message.save).to be(true)      
      end

      it 'Not Persisted' do 
        message.participant = nil
        expect(message.save).to be(false)
      end
    end
  end
end
