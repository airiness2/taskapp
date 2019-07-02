FactoryBot.define do

  factory :task do
    name { 'test_task_01' }
    detail { 'testtesttest' }
  end

  factory :second_task, class: Task do
    name { 'test_task_02' }
    detail { 'samplesample' }
  end
end
