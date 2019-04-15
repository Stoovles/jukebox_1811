class Award < ApplicationRecord
  has_many :songs, through: :song_awards
  has_many :song_awards
  validates_presence_of :name


  def self.awards_for_songs(song)
    joins(:song_awards).where(song_awards: {song_id: song})
  end
end
