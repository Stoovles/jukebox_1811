require 'rails_helper'

RSpec.describe Song, type: :model do
  describe 'relationships' do
    it {should belong_to :artist}
    it {should have_many :playlist_songs}
    it {should have_many(:playlists).through(:playlist_songs)}
  end

  describe 'validations' do
    it {should validate_presence_of :title}
    it {should validate_presence_of :length}
    it { should validate_numericality_of(:length).is_greater_than_or_equal_to(0) }
  end

  describe ".songs_for_awards" do
    it "should return all songs for a specific award" do
      @journey = Artist.create(name: 'Journey')

      @song_1 = @journey.songs.create(title: "Don't Stop Believin'", length: 345, play_count: 13)
      @song_2 = @journey.songs.create(title: "This Must be the Place", length: 13, play_count: 11)

      @award_1 = Award.create(name: "Best Song")

      @song_award_1 = SongAward.create(award_id: @award_1.id, song_id: @song_1.id)
      @song_award_2 = SongAward.create(award_id: @award_1.id, song_id: @song_2.id)


      expect(Song.songs_for_awards(@award_1)).to eq([@song_1, @song_2])
    end
  end
end
