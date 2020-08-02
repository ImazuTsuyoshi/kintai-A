# coding: utf-8

User.create!(name: "モンキー.D.ルフィー(管理者)",
             email: "sample@email.com",
             admin: true,
             password: "password",
             employee_number: "1")
  

        
User.create!(name: "ロロノア.ゾロ(上長A)",
             email: "sampleA@email.com",
             superior: true,
             password: "password",
             employee_number: "2")
             
User.create!(name: "サンジ(上長B)",
             email: "sampleB@email.com",
             superior: true,
             password: "password",
             employee_number: "3") 
             
User.create!(name: "ナミ",
             email: "sampleC@email.com",
             password: "password",
             employee_number: "4") 
             
User.create!(name: "ウソップ",
             email: "sampleD@email.com",
             password: "password",
             employee_number: "5")  
             
User.create!(name: "チョッパー",
             email: "sampleE@email.com",
             password: "password",
             employee_number: "6")   
             
User.create!(name: "ロビン",
             email: "sampleF@email.com",
             password: "password",
             employee_number: "7") 
             
User.create!(name: "フランキー",
             email: "sampleG@email.com",
             password: "password",
             employee_number: "9")                

User.create!(name: "ブルック",
             email: "sampleH@email.com",
             password: "password",
             employee_number: "10")   
             
Base.create!(name: "拠点A",
             base_id: "2",
             attendance_sort: ""
             )              
