class Song < ActiveRecord::Base

  belongs_to :user
  has_many :votes

  validates :artist, presence: true, length: { maximum: 100 }
  validates :song_title, presence: true, length: { maximum: 100 }
  validates :url, length: { maximum: 100 }
  
end