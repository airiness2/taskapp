# このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'

# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "タスク管理機能", type: :feature do

  background do
    FactoryBot.create(:user)
    FactoryBot.create(:second_user)
    FactoryBot.create(:label)
    FactoryBot.create(:second_label)

#    FactoryBot.create(:task)
#    FactoryBot.create(:second_task)

    visit new_session_path

    fill_in 'session_email', with: 'test1@example.com'
    fill_in 'session_password', with: 'password'
    click_on 'ログイン'

  end

  # scenario（itのalias）の中に、確認したい各項目のテストの処理を書きます。
  scenario "タスク一覧のテスト" do
    visit tasks_path

    expect(page).to have_content 'testtesttest'
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

    click_on '登録する'

    click_link("詳細", :match => :first)

    expect(page).to have_content 'task_detail_04'

  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    visit new_task_path

    fill_in 'task_name', with: 'test_task_04'
    fill_in 'task_detail', with: 'task_detail_04'
    fill_in 'task_endtime', with: '2021/11/25'

    click_on '登録する'

    visit tasks_path

    expect(page).to have_text 'test_task_04 task_detail_04 2021/11/25 未着手 低 詳細 編集 削除 test_task_01 testtesttest 2017/10/06 未着手 中 詳細 編集 削除'
  end


  scenario "終了期限でソートされるかのテスト" do
    visit new_task_path

    fill_in 'task_name', with: 'test_task_05'
    fill_in 'task_detail', with: 'task_detail_05'
    fill_in 'task_endtime', with: '2020/10/6'

    click_on '登録する'

    click_on '終了期限'

    expect(page).to have_text 'test_task_05 task_detail_05 2020/10/06 未着手 低 詳細 編集 削除 test_task_01 testtesttest 2017/10/06 未着手 中 詳細 編集 削除'
  end

  scenario "タスク名で検索されるかのテスト" do
    visit tasks_path
    fill_in 'q_name_cont', with: 'test_task_01'
    click_on '検索'
    expect(page).to have_content 'test_task_01'
  end

  scenario "ステータスで検索されるかのテスト" do
    visit new_task_path

    fill_in 'task_name', with: 'test_task_05'
    fill_in 'task_detail', with: 'task_detail_05'

    select '着手中', :from => 'task_status'

    click_on '登録する'

    visit tasks_path
    select '着手中', :from => 'q_status_eq'

    click_on '検索'
    expect(page).to have_content 'test_task_05'
  end

  scenario "優先度でソートされるかのテスト" do
    visit new_task_path

    fill_in 'task_name', with: 'test_task_06'
    fill_in 'task_detail', with: 'task_detail_06'
    fill_in 'task_endtime', with: '2021/11/25'

    click_on '登録する'

    click_on '優先度'

    expect(page).to have_text 'test_task_01 testtesttest 2017/10/06 未着手 中 詳細 編集 削除 test_task_06 task_detail_06 2021/11/25 未着手 低 詳細 編集 削除'

  end

  scenario "ページネートが動作するかのテスト" do
    20.times do |n|
      visit new_task_path

      fill_in 'task_name', with: "test_task_#{n}"
      fill_in 'task_detail', with: "task_detail_#{n}"

      click_on '登録する'
    end

    click_on 'Next'

    expect(page).to have_text 'test_task_9'
  end


  scenario "ラベルが設定されるかのテスト" do
    visit new_task_path

    fill_in 'task_name', with: 'test_task_04',  match: :first
    fill_in 'task_detail', with: 'task_detail_04', match: :first

    check 'task_label_ids_19'

    click_on '登録する'

    click_link("詳細", :match => :first)

    expect(page).to have_content '仕事'

  end

  scenario "ラベルで検索されるかのテスト" do
    visit new_task_path

    fill_in 'task_name', with: 'test_task_05'
    fill_in 'task_detail', with: 'task_detail_05'

    check 'task_label_ids_21'

    click_on '登録する'

    visit tasks_path
    select '仕事', :from => 'q_labels_id_eq'

    click_on '検索'
    expect(page).to have_content 'test_task_05'
  end

end
