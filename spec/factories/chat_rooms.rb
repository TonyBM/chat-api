FactoryBot.define do
  factory :chat_room do
    name { FFaker::Lorem.words(3) }
    description { FFaker::Lorem.sentence }
  end
end
