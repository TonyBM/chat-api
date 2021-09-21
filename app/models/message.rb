class Message
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  
  field :content, type: String
  field :participant, type: String
  embedded_in :chat_room

  validates_presence_of :participant
end
