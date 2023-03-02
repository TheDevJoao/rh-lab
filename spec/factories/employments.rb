FactoryBot.define do
  factory :employment do
    employee
    department
    position
    salary { rand(2000..10_000) }
    registration { FFaker::Number.number(digits: 2) }
    starts_on { FFaker::Time.between(Time.zone.yesterday - 2.years, Time.zone.today).to_date }
    ends_on { nil }
    reason { [:hire, :promote, :restructure].sample }
  end
end
