require 'rails_helper'

RSpec.describe 'when visitor visits awards show', type: :feature do
  before :each do
    @journey = Artist.create(name: 'Journey')

    @song_1 = @journey.songs.create(title: "Don't Stop Believin'", length: 345, play_count: 13)
    @song_2 = @journey.songs.create(title: "This Must be the Place", length: 13, play_count: 11)

    @award_1 = Award.create(name: "Best Song")

    @song_award_1 = SongAward.create(award_id: @award_1.id, song_id: @song_1.id)
    @song_award_2 = SongAward.create(award_id: @award_1.id, song_id: @song_2.id)

  end


  it 'sees all songs associated with this award' do
    user = User.create!(username: 'papa smurf', password: 'password', role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)


    visit award_path(@award_1)

    expect(page).to have_content("Don't Stop Believin'")
    expect(page).to have_content("This Must be the Place")

  end
end
