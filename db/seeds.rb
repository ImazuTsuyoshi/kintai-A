# coding: utf-8

User.create!(name: "今津　剛",
             email: "sample@email.com",
             superior: false,
             admin: true,
             password: "password",
             password_confirmation: "password")
  

        
User.create!(name: "上長A",
             email: "sampleA@email.com",
             superior: true,
             admin: false,
             password: "password",
             password_confirmation: "password")
             
User.create!(name: "上長B",
             email: "sampleB@email.com",
             superior: true,
             admin: false,
             password: "password",
             password_confirmation: "password") 
             
User.create!(name: "テスト",
             email: "sampleC@email.com",
             superior: false,
             admin: false,
             password: "password",
             password_confirmation: "password")              
             
             
60.times do |n|
  name = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end               