# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Article.destroy_all
Story.destroy_all
Course.destroy_all

admin = User.new({

    email: "rakan@starfishproject.ae",
    password: "password",
    name: "rakan",
    admin: true
    })

admin.save!

image = "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png"
youtube = "https://www.youtube.com/watch?v=YoaJW7PPJSM&index=2&list=PLJj-2-ZfLCt8_d1_vyt_g6mWAmKnoVwyt"

articles = []
5.times do
  title = Faker::ChuckNorris.fact
  articles << Article.create!({
    title: title,
    description: Faker::Lorem.paragraph(50),
    locale: "en",
    youtube: youtube
    })
end

article = Article.first
article.locale = "ea"
article.photo = image
article.youtube = youtube
article.save!

stories = []
5.times do
  title = Faker::ChuckNorris.fact
  stories << Story.create!({
    title: title,
    description: Faker::Lorem.paragraph(50),
    locale: "en",
    youtube: youtube
    })
end

story = Story.first
story.locale = "ea"
story.photo = image
story.save!

courses = []
5.times do
  date_start = DateTime.current - rand(1000)
  courses << Course.create!({
    date_start: date_start,
    date_finish: date_start + 4,
    time_start: DateTime.current,
    location: "Dubai",
    locale: "en"
    })
end

course = Course.second
course.locale = "ea"
course.description = Faker::ChuckNorris.fact
course.save!