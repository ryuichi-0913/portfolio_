# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   name: 'テスト花子',
   email: 'a@a',
   password: 'aaaaaa',
)

User.create!(
   email: "b@b",
   name: "テスト太郎",
   password: "bbbbbb",
   )

   Food.create!(
   	[
   				{
                  food_name:"パズルチョコ",
                  food_introduction: "自家製のチョコレートに生クリームを混ぜ合わせ作りました",
                  food_image: open("./app/assets/images/chain.png")
                 },
   				{
                  food_name:"壁のようなケーキ",
                  food_introduction: "かべのように立ちはだかるケーキ",
                  food_image: open("./app/assets/images/hear.jpg")
                 },
   				{
                  food_name:"テスト３",
                  food_introduction: "テキストテキストテキストテキスト",
                  food_image: open("./app/assets/images/hear.jpg")
                 },
	]
  	)