class Playlist < ActiveRecord::Base
  
  attr_accessible :name, :slug, :user_id

  has_many :tracks
  belongs_to :user

  validates :name, presence: true
  validates :slug, presence: true
  
end