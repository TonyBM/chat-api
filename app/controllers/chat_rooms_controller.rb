class ChatRoomsController < ApplicationController
    def join_room
        chat_room = ChatRoom.find_by(_id: params[:room_id])
        participantId = Participant.find_by(_id: params[:participant]).id.to_s
        
        return render json: params, status: :bad_request unless chat_room.can_add?(participantId)

        if chat_room.update(participants: chat_room.add_participant(participantId))
            render json: chat_room
        else
            render json: params, status: :unprocesable_entity
        end      
        
    end

    private 

    def chat_room_params
        @chat_room_params ||= params.permit(
            :name,
            :description
        )
    end

end
