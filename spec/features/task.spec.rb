# このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'

# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "タスク管理機能", type: :feature do

  background do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end

  # scenario（itのalias）の中に、確認したい各項目のテストの処理を書きます。
  scenario "タスク一覧のテスト" do
    visit tasks_path

    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path

    fill_in 'task_name', with: 'test_task_03'
    fill_in 'task_detail', with: 'task_detail_03'

    click_on '登録する'

    expect(page).to have_content 'task_detail_03'
  end

  scenario "タスク詳細のテスト" do
    visit new_task_path

    fill_in 'task_name', with: 'test_task_04',  match: :first
    fill_in 'task_detail', with: 'task_detail_04', match: :first
#    fill_in 'task_endtime', with: '2019/07/06 20:00:00', match: :first
#    select '2019-07-06 20:00:00', :from => 'task_endtime', match: :first


    click_on '登録する'

    click_link("詳細", :match => :first)

    expect(page).to have_content 'task_detail_04'

  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    visit tasks_path

    expect(page).to have_text 'test_task_02 samplesample 2015/12/06 12:00 未着手 詳細 編集 削除 test_task_01 testtesttest 2017/10/06 12:00 未着手 詳細 編集 削除'
  end


  scenario "終了期限でソートされるかのテスト" do
    visit new_task_path

    fill_in 'task_name', with: 'test_task_05'
    fill_in 'task_detail', with: 'task_detail_05'
    select '2020', :from => 'task_endtime_1i'
    select '10', :from => 'task_endtime_2i'
    select '6', :from => 'task_endtime_3i'
    select '12', :from => 'task_endtime_4i'
    select '00', :from => 'task_endtime_5i'

    click_on '登録する'

    click_on '終了期限'

    expect(page).to have_text 'test_task_05 task_detail_05 2020/10/06 12:00 未着手 詳細 編集 削除 test_task_01 testtesttest 2017/10/06 12:00 未着手 詳細 編集 削除'
  end


end
