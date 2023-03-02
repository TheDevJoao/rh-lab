FactoryBot.define do
  factory :assignment do
    employee
    project
    starts_on { FFaker::Time.between(Time.zone.yesterday, Time.zone.yesterday - 2.months).to_date }
    ends_on { FFaker::Time.between(Time.zone.today, Time.zone.today + 2.months).to_date }
  end
end
