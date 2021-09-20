class Message
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  
  field :content, type: String
  has_one :participant

  validates_presence_of :participant
end
