class ChatRoom
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field :name, type: String
  field :description, type: String
  field :participants, type: Array

  embeds_many :messages

  validates_presence_of :name

  def can_add?(participant)
    return true unless self.participants

    !self.participants.include?(participant)
  end

  def add_participant(participant)
    self.participants.nil? ? [participant] : self.participants.push(participant)
  end

end
