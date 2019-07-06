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
    # new_task_pathにvisitする（タスク登録ページに遷移する）
    visit new_task_path

    # 「タスク名」というラベル名の入力欄と、「タスク詳細」というラベル名の入力欄に
    # タスクのタイトルと内容をそれぞれfill_in（入力）する
    fill_in 'task_name', with: 'test_task_03'
    fill_in 'task_detail', with: 'task_detail_03'

    #save_and_open_page
    # 「登録する」というvalue（表記文字）のあるボタンをclick_onする（クリックする）
    click_on '登録する'

    # clickで登録されたはずの情報が、タスク詳細ページに表示されているかを確認する
    # （タスクが登録されたらタスク詳細画面に遷移されるという前提）
    expect(page).to have_content 'task_detail_03'
  end

  scenario "タスク詳細のテスト" do
    visit new_task_path

    fill_in 'task_name', with: 'test_task_04',  match: :first
    fill_in 'task_detail', with: 'task_detail_04', match: :first
    fill_in 'task_endtime', with: '2019-07-06 20:00:00 +0900', match: :first

    click_on '登録する'

    click_link("詳細", :match => :first)

    expect(page).to have_content 'task_detail_04'

  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    visit tasks_path

    expect(page).to have_text 'test_task_02 samplesample 2019-12-06 12:00:00 +0900 詳細 編集 削除 test_task_01 testtesttest 2019-10-06 12:00:00 +0900 詳細 編集 削除'
  end


  scenario "終了期限でソートされるかのテスト" do
    visit new_task_path

    fill_in 'task_name', with: 'test_task_05'
    fill_in 'task_detail', with: 'task_detail_05'
    fill_in 'task_endtime', with: '2015-07-06 20:00:00 +0900'

    click_on '登録する'

    click_on '終了期限でソートする'

    expect(page).to have_text 'test_task_02 samplesample 2019-12-06 12:00:00 +0900 詳細 編集 削除 test_task_01 testtesttest 2019-10-06 12:00:00 +0900 詳細 編集 削除'
  end


end
