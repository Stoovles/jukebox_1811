require 'rails_helper'

RSpec.describe 'when visitor visits songs show', type: :feature do
  before :each do
    @journey = Artist.create(name: 'Journey')
    @song_1 = @journey.songs.create(title: "Don't Stop Believin'", length: 345, play_count: 13)
    @song_2 = @journey.songs.create(title: "This Must be the Place", length: 13, play_count: 11)
    @award_1 = Award.create(name: "Best Song")
    @award_2 = Award.create(name: "Best Stuff")
    @award_3 = Award.create(name: "Worst Song")
    @award_4 = Award.create(name: "Worst Stuff")

    @song_award_1 = SongAward.create(award_id: @award_1.id, song_id: @song_1.id)
    @song_award_2 = SongAward.create(award_id: @award_2.id, song_id: @song_1.id)
    @song_award_3 = SongAward.create(award_id: @award_3.id, song_id: @song_1.id)
    @song_award_4 = SongAward.create(award_id: @award_4.id, song_id: @song_1.id)

  end

  it 'can see a header of awards' do
    visit song_path(@song_1)

    expect(page).to have_content("Awards for this Song:")
    expect(page).to have_content("Best Song")
    expect(page).to have_content("Best Stuff")
    expect(page).to have_content("Worst Song")
    expect(page).to have_content("Worst Stuff")
  end

end
