require 'rails_helper'

RSpec.describe 'awards workflow' do
  context 'as an unregistered user' do
    it 'cannot see form to create awards' do
      user = User.create!(username: 'papa smurf', password: 'password', role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit awards_path

      expect(page).to_not have_button('Create Award')
    end

    it 'can see all awards' do
      user = User.create!(username: 'papa smurf', password: 'password', role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      award_1 = Award.create!(name: "Best Song")
      award_2 = Award.create!(name: "Worst Song")

      visit awards_path

      expect(page).to have_link("Best Song")
      expect(page).to have_link("Worst Song")
    end

    it 'award links to show page' do
      user = User.create!(username: 'papa smurf', password: 'password', role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      award_1 = Award.create!(name: "Best Song")
      award_2 = Award.create!(name: "Worst Song")

      visit awards_path

      click_link "Best Song"

      expect(current_path).to eq(award_path(award_1))
      expect(page).to have_content("Best Song")
    end

  end


end
