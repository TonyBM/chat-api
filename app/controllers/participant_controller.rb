class ParticipantController < ApplicationController
    def index
        Participant.all.entries
    end

    def create
        participant = Participant.new(participant_params)

        if participant.save
            render json: participant
        else
            render json: participant, status: :unprocesable_entity
        end
    end

    private
    def participant_params
        @participant_params ||= params.permit(:user_id, :username)
    end
end
