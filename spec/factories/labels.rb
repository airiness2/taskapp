FactoryBot.define do
  factory :label do
    name { '仕事' }
  end

  factory :second_label, class: Label do
    name { '趣味' }
  end
end
