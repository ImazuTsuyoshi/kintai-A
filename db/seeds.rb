# coding: utf-8

User.create!(name: "今津　剛",
             email: "sample@email.com",
             affiliation: "",
             employee_number: "",
             basic_work_time: "",
             designated_work_start_time: "",
             designated_work_end_time: "",
             superior: false,
             admin: true,
             password: "password")
  

        
User.create!(name: "上長A",
             email: "sampleA@email.com",
             affiliation: "",
             employee_number: "",
             uid: "",
             basic_work_time: "",
             designated_work_start_time: "",
             designated_work_end_time: "",
             superior: true,
             admin: false,
             password: "password")
             
User.create!(name: "上長B",
             email: "sampleB@email.com",
             affiliation: "",
             employee_number: "",
             uid: "",
             basic_work_time: "",
             designated_work_start_time: "",
             designated_work_end_time: "",
             superior: true,
             admin: false,
             password: "password") 
             
User.create!(name: "テスト",
             email: "sampleC@email.com",
             affiliation: "",
             employee_number: "",
             uid: "",
             basic_work_time: "",
             designated_work_start_time: "",
             designated_work_end_time: "",
             superior: false,
             admin: false,
             password: "password")              
             
             
60.times do |n|
  name = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end               