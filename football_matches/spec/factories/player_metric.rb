FactoryBot.define do
  factory :player_metric do
    kilometers_run { SecureRandom.random_number * 30 }
    passes { rand(10..15) }
    passes_success { rand(0..10) }
    goals { rand(0..2) }
  end

  trait :zero_metrics do
    kilometers_run { 0.0 }
    passes { 0 }
    passes_success { 0 }
    goals { 0 }
  end
end
