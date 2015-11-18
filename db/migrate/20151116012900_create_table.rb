class CreateTable < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :song_title
      t.string :url
      t.timestamps
    end
  end
end
