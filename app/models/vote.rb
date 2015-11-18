class Vote < ActiveRecord::Base

  belongs_to :song
  belongs_to :user

  validates :username, presence: true, uniqueness: true
  validates :vote, presence: true
  
end