FactoryBot.define do
  factory :department do
    name { 'Engineering' }
    association :manager, factory: :employee
  end
end
