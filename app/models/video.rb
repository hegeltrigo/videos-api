class Video < ApplicationRecord
  belongs_to :user

  before_create :update_youtube_id

  validates :title, :description, presence: true

  def update_youtube_id
    self.youtube_video_id = YoutubeID.from("#{self.video_url}")
  end  

end
