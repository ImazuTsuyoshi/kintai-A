# coding: utf-8

User.create!(name: "今津　剛",
             email: "sample@email.com",
             admin: true,
             password: "password")
  

        
User.create!(name: "上長A",
             email: "sampleA@email.com",
             superior: true,
             password: "password")
             
User.create!(name: "上長B",
             email: "sampleB@email.com",
             superior: true,
             password: "password") 
             
User.create!(name: "テスト",
             email: "sampleC@email.com",
             password: "password")              
             
Base.create!(name: "拠点A",
             base_id: "2",
             attendance_sort: ""
             )              
