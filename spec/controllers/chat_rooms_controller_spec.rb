require 'rails_helper'

RSpec.describe ChatRoomsController, type: :controller do
    context '#join_room' do
        let!(:participant) { FactoryBot.create(:participant) }
        let!(:chat_room) { FactoryBot.create(:chat_room)}

        let(:params) do
            {
                "room_id": chat_room.id,
                "participant": participant.id
            }
        end


        it 'Joined Succesfully' do
            post :join_room, params: params
    
            expect(response).to have_http_status(:success)
            expect(response.content_type).to eq('application/json; charset=utf-8')
        end

        it 'Tries to join again' do
            post :join_room, params: params
    
            expect(response).to have_http_status(:bad_request)
            expect(response.content_type).to eq('application/json; charset=utf-8')
        end

        let(:wrong_user_params) do
            {
                "room_id": chat_room.id,
                "participant": ""
            }
        end

        it 'Tries to send unexistent user' do
            post :join_room, params: params
    
            expect(response).to have_http_status(:not_found)
            expect(response.content_type).to eq('application/json; charset=utf-8')
        end

    end


    context '#send_message' do
        let!(:participant) { FactoryBot.create(:participant) }
        let!(:chat_room) { FactoryBot.create(:chat_room)}

        let(:params) do
            {
                room_id: chat_room.id,
                participant: participant.id,
                content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
            }
        end


        it 'Sent Succesfully' do
            post :join_room, params: params
    
            expect(response).to have_http_status(:success)
            expect(response.content_type).to eq('application/json; charset=utf-8')
        end

        let(:wrong_user_params) do
            {
                "room_id": chat_room.id,
                "participant": "",
                content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
            }
        end

        it 'Tries to send unexistent user' do
            post :join_room, params: params
    
            expect(response).to have_http_status(:bad_request)
            expect(response.content_type).to eq('application/json; charset=utf-8')
        end

    end

end