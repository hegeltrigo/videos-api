user = User.create(email: 'hegeltrigo@gmail.com', password: 'videos123', password_confirmation: 'trabajosya123')


(1..30).each do |num|
  Video.create(title: "video #{num}", description: "video description #{num}", youtube_video_id: "tgbNymZ7vqY", user: user)
end  