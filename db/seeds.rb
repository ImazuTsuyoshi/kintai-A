# coding: utf-8

User.create!(name: "モンキー.D.ルフィー(管理者)",
             email: "sample@email.com",
             admin: true,
             password: "password")
  

        
User.create!(name: "ロロノア.ゾロ(上長A)",
             email: "samplea@email.com",
             superior: true,
             password: "password")
             
User.create!(name: "サンジ(上長B)",
             email: "sampleb@email.com",
             superior: true,
             password: "password") 
             
User.create!(name: "ナミ",
             email: "samplec@email.com",
             password: "password") 
             
User.create!(name: "ウソップ",
             email: "sampled@email.com",
             password: "password")  
             
User.create!(name: "チョッパー",
             email: "samplee@email.com",
             password: "password")   
             
User.create!(name: "ロビン",
             email: "samplef@email.com",
             password: "password") 
             
User.create!(name: "フランキー",
             email: "sampleg@email.com",
             password: "password")                

User.create!(name: "ブルック",
             email: "sampleh@email.com",
             password: "password")   
             
Base.create!(name: "拠点A",
             base_id: "2",
             attendance_sort: ""
             )              
