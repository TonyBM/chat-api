FactoryBot.define do
  factory :message do
    content {FFaker::Lorem.sentence}
    participant {FactoryBot.create(:participant)}
  end
end
