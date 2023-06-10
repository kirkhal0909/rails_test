FactoryBot.define do
  factory :player_metric do
    kilometers_run { SecureRandom.random_number * 30 }
    passes { rand(10..15) }
    passes_success { rand(0..10) }
    goals { rand(0..2) }
  end
end
