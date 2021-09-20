class Participant
  include Mongoid::Document
  include Mongoid::Timestamps

  field :user_id, type: String
  field :username, type: String

  validates_presence_of :user_id, :username
end
