require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @user = User.create(name: 'testuser1', email: "test@example.com", password: "hogehoge")
  end

  it "nameが空ならバリデーションが通らない" do
    task = Task.new(name: '', detail: '失敗テスト', user_id: @user.id)
    expect(task).not_to be_valid
  end

  it "detailが空ならバリデーションが通らない" do
    task = Task.new(name: '失敗テスト', detail: '', user_id: @user.id)
    expect(task).not_to be_valid
  end

  it "titleとcontentに内容が記載されていればバリデーションが通る" do
    task = Task.new(name: '成功テスト', detail: '成功テスト', user_id: @user.id)
    expect(task).to be_valid
  end
end
