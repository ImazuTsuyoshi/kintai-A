# coding: utf-8

User.create!(name: "モンキー.D.ルフィー(管理者)",
             email: "sample@email.com",
             admin: true,
             password: "password")
  

        
User.create!(name: "ロロノア.ゾロ(上長A)",
             email: "sampleA@email.com",
             superior: true,
             password: "password")
             
User.create!(name: "サンジ(上長B)",
             email: "sampleB@email.com",
             superior: true,
             password: "password") 
             
User.create!(name: "ナミ",
             email: "sampleC@email.com",
             password: "password") 
             
User.create!(name: "ウソップ",
             email: "sampleD@email.com",
             password: "password")  
             
User.create!(name: "チョッパー",
             email: "sampleE@email.com",
             password: "password")   
             
User.create!(name: "ロビン",
             email: "sampleF@email.com",
             password: "password") 
             
User.create!(name: "フランキー",
             email: "sampleG@email.com",
             password: "password")                

User.create!(name: "ブルック",
             email: "sampleH@email.com",
             password: "password")   
             
Base.create!(name: "拠点A",
             base_id: "2",
             attendance_sort: ""
             )              
