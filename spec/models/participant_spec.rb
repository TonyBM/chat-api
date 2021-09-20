require 'rails_helper'

RSpec.describe Participant, type: :model do
  describe 'Validations' do 
    context 'Prescence' do
      it { is_expected.to validate_presence_of(:username) }
      it { is_expected.to validate_presence_of(:user_id) }
    end

    context 'save' do
      let(:participant) { FactoryBot.build(:participant) }
      it 'persisted' do
        expect(participant.save).to be(true)      
      end

      it 'Not Persisted' do 
        participant.user_id = nil
        expect(participant.save).to be(false)
      end
    end
  end
end
