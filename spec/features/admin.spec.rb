require 'rails_helper'

RSpec.feature "管理画面機能", type: :feature do
  background do
    FactoryBot.create(:user)
    FactoryBot.create(:second_user)

    visit new_session_path

    fill_in 'session_email', with: 'test2@example.com'
    fill_in 'session_password', with: 'password'
    click_on 'ログイン'
  end

  scenario "ユーザ一覧のテスト" do
    visit admin_users_path

    expect(page).to have_text 'test1 test1@example.com 1'
  end

  scenario "ユーザ追加のテスト" do
    visit new_admin_user_path

    fill_in 'user_name', with: 'test10'
    fill_in 'user_email', with: 'test10@example.com'
    fill_in 'user_password', with: 'password'
    click_on '登録する'

    expect(page).to have_content 'test10'
  end

  scenario "ユーザ詳細画面のテスト" do
    visit admin_users_path

    click_link("詳細", :match => :first)

    expect(page).to have_text 'test_task_01 testtesttest 2017/10/06 未着手 中'
  end

  scenario "ユーザ情報更新のテスト" do
    visit admin_users_path
    click_link("編集", :match => :first)

    fill_in 'user_name', with: 'test99'
    fill_in 'user_email', with: 'test99@example.com'
    click_on '更新する'

    expect(page).to have_content 'test99'
  end

  scenario "ユーザ削除のテスト" do
    visit admin_users_path
    click_link("削除", :match => :first)

    expect(page).to_not have_content 'test1'
  end
end
