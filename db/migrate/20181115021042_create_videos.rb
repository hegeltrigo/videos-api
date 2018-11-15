class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.text :video_code
      t.references :user, foreign_key: true
      t.string :youtube_video_id
      t.datetime :upload_date

      t.timestamps
    end
  end
end
