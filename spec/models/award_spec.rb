require 'rails_helper'

RSpec.describe Award, type: :model do
  describe 'relationships' do
    it {should have_many :song_awards}
    it {should have_many(:songs).through(:song_awards)}
  end

  describe 'validations' do
    it {should validate_presence_of :name}
  end


  describe ".awards_for_songs" do
    it "should return all awards for a specific song" do
      @journey = Artist.create(name: 'Journey')

      @song_1 = @journey.songs.create(title: "Don't Stop Believin'", length: 345, play_count: 13)

      @award_1 = Award.create(name: "Best Song")
      @award_2 = Award.create(name: "Best Stuff")
      @award_3 = Award.create(name: "Worst Song")
      @award_4 = Award.create(name: "Worst Stuff")

      @song_award_1 = SongAward.create(award_id: @award_1.id, song_id: @song_1.id)
      @song_award_2 = SongAward.create(award_id: @award_2.id, song_id: @song_1.id)
      @song_award_3 = SongAward.create(award_id: @award_3.id, song_id: @song_1.id)
      @song_award_4 = SongAward.create(award_id: @award_4.id, song_id: @song_1.id)


      expect(Award.awards_for_songs(@song_1)).to eq([@award_1, @award_2, @award_3, @award_4])
    end
  end
end
