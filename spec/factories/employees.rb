FactoryBot.define do
  factory :employee do
    name { FFaker::NameBR.name }
  end

  trait :with_active_employment do
    after(:create) do |employee|
      create(:employment, employee:, ends_on: nil)
    end
  end

  trait :with_inactive_employment do
    after(:create) do |employee|
      create(:employment, employee:, ends_on: Time.zone.today - 30.days)
    end
  end

  trait :with_department do
    after(:create) do |employee|
      department = create(:department, name: 'Engineering')
      create(:employment, employee:, department:)
    end
  end
end
