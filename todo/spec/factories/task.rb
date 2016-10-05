FactoryGirl.define do
  factory :task do
    title FFaker::Conference.name
    description FFaker::Lorem.paragraph
  end

  factory :invalid_task, parent: :task do |t|
    t.title nil
  end
end
