# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#50.times do |no|
#  Task.create(:name => "タイトル #{no}", :detail => "詳細 #{no}")
#end

#User.create(:name => "watanabe", email: "test@example.com", password_digest: "password")

Label.create(name: "仕事")
Label.create(name: "趣味")
Label.create(name: "家事")
Label.create(name: "雑用")
