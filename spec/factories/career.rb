FactoryBot.define do
  factory :career do
    name          { FFaker::Name.name }
    description   { FFaker::Lorem.paragraphs(1 + Kernel.rand(5)).join("\n") }
  end
end
