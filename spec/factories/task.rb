FactoryBot.define do

  factory :task do
    name { 'test_task_01' }
    detail { 'testtesttest' }
    endtime { '2019-10-06 12:00:00'}
  end

  factory :second_task, class: Task do
    name { 'test_task_02' }
    detail { 'samplesample' }
    endtime { '2019-12-06 12:00:00'}
  end
end
