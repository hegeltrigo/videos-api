user = User.create(email: 'hegeltrigo@gmail.com', password: 'videos123', password_confirmation: 'trabajosya123')
user1 = User.create(email: 'user1@gmail.com', password: 'videos123', password_confirmation: 'trabajosya123')
user2 = User.create(email: 'user2@gmail.com', password: 'videos123', password_confirmation: 'trabajosya123')


(1..10).each do |num|
  Video.create(title: "video #{num}", description: "video description #{num}", video_url: "https://www.youtube.com/watch?v=tgbNymZ7vqY",  user: user)
end  

(1..10).each do |num|
  Video.create(title: "video #{num}", description: "video description #{num}", video_url: "https://www.youtube.com/watch?v=tgbNymZ7vqY", user: user1)
end

(1..10).each do |num|
  Video.create(title: "video #{num}", description: "video description #{num}", video_url: "https://www.youtube.com/watch?v=tgbNymZ7vqY", user: user2)
end