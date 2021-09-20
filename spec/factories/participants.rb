FactoryBot.define do
  factory :participant do
    user_id { rand(16).to_s }
    username { FFaker::NameMX.name }
    
  end
end