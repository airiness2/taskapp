require 'rails_helper'

RSpec.feature "ユーザ管理機能", type: :feature do
  background do
    FactoryBot.create(:user)
    FactoryBot.create(:second_user)
  end

  scenario "ユーザ追加のテスト" do
    visit new_user_path

    fill_in 'user_name', with: 'test10'
    fill_in 'user_email', with: 'test10@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'アカウントを作成する'

    expect(page).to have_content 'test10'
  end

  scenario "ログイン機能のテスト" do
    visit new_session_path

    fill_in 'session_email', with: 'test1@example.com'
    fill_in 'session_password', with: 'password'
    click_on 'ログイン'

    expect(page).to have_content 'test1'
  end

  scenario "他のユーザのマイページが開けないテスト" do
    visit new_session_path

    fill_in 'session_email', with: 'test1@example.com'
    fill_in 'session_password', with: 'password'
    click_on 'ログイン'

    visit user_path(7)
    expect(page).to_not have_content 'test2'
  end

  scenario "ログインしている時はユーザ登録画面にいけないテスト" do
    visit new_session_path

    fill_in 'session_email', with: 'test1@example.com'
    fill_in 'session_password', with: 'password'
    click_on 'ログイン'

    visit new_user_path

    expect(page).to_not have_content 'アカウントを作成する'
  end
end
