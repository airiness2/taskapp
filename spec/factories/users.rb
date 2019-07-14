FactoryBot.define do

  factory :user do
    name { "test1" }
    email { "test1@example.com" }
    password { "password" }

    after(:create) do |user|
      create(:task, user: user)
    end
  end

  factory :second_user, class: User do
    name { "test2" }
    email { "test2@example.com" }
    password { "password" }

    after(:create) do |second_user|
      create(:second_task, user: second_user)
    end
  end

end
