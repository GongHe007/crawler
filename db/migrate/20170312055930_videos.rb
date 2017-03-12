class Videos < ActiveRecord::Migration[5.0]
  def change
    create_table "videos", force: :cascade do |t|
      t.integer "video_type", null: false
      t.string "url", null: false
      t.string "img_url", null: false
      t.string "title", null: false
      t.timestamps null: false
    end
    add_index "videos", ["url"], :name => "index_videos_on_url", using: :btree
  end
end
