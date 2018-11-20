class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :description
      t.string :youtube_video_id
      t.string :video_code
      t.references :user, foreign_key: true
      t.datetime :upload_date

      t.timestamps
    end
  end
end
