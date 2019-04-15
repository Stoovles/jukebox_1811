require 'rails_helper'

RSpec.describe 'awards workflow' do
  context 'as an admin user' do
    it 'allows admin to see awards form' do
      user = User.create!(username: 'papa smurf', password: 'password', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_awards_path

      expect(page).to have_button('Create Award')
    end

    it 'can see all awards' do
      user = User.create!(username: 'papa smurf', password: 'password', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      award_1 = Award.create!(name: "Best Song")
      award_2 = Award.create!(name: "Worst Song")

      visit admin_awards_path

      expect(page).to have_content("Best Song")
      expect(page).to have_content("Worst Song")
    end

    it 'can create new award' do
      user = User.create!(username: 'papa smurf', password: 'password', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_awards_path

      fill_in "Name", with: "Test Award"

      click_button "Create Award"

      expect(current_path).to eq(admin_awards_path)
      expect(page).to have_content("Test Award")


    end
  end


end
