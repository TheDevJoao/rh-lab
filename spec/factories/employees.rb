FactoryBot.define do
  factory :employee do
    name { FFaker::NameBR.name }
  end
end
