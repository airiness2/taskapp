FactoryBot.define do

  factory :task do
    name { 'test_task_01' }
    detail { 'testtesttest' }
    endtime { '2017-10-06 12:00:00'}
    priority { 1 }
    user_id { 1 }
    user
  end

  factory :second_task, class: Task do
    name { 'test_task_02' }
    detail { 'samplesample' }
    endtime { '2015-12-06 12:00:00'}
    priority { 2 }
    user_id { 2 }
  end
end
