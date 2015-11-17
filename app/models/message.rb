class Message < ActiveRecord::Base

  validates :artist, presence: true, length: { maximum: 100 }
  validates :song_title, presence: true, length: { maximum: 100 }
  validates :url, length: { maximum: 100 }
  
end