FactoryBot.define do
  factory :player do
    full_name { "player #{SecureRandom.alphanumeric}" }
  end
end
