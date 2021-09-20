require 'rails_helper'

RSpec.describe ChatRoom, type: :model do

  describe 'Validations' do 
    context 'Prescence' do
      it { is_expected.to validate_presence_of(:name) }
    end

    context 'save' do
      let(:chat_room) { FactoryBot.build(:chat_room) }
      it 'persisted' do
        expect(chat_room.save).to be(true)      
      end

      it 'Not Persisted' do 
        chat_room.name = nil
        expect(chat_room.save).to be(false)
      end
    end
  end
end
