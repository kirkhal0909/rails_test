FactoryBot.define do
  factory :team do
    name { "team #{SecureRandom.alphanumeric}" }
    players { build_list :player, 7 }
  end
end
