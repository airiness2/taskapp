# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "admin_user", email: "admin@example.com", password: "taskapp", admin: true)

Label.create(name: "仕事")
Label.create(name: "趣味")
Label.create(name: "家事")
Label.create(name: "緊急")
Label.create(name: "その他")

10.times do |no|
  Task.create(:name => "タイトル #{no}", :detail => "詳細 #{no}", :user_id => 1)
end
