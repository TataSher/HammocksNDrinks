require './spec/spec_helper.rb'
require './makers_hnd_web_app.rb'
feature 'list all space hammocks' do
    scenario 'list one space hammock' do
      visit '/space_hammocks/new'
      fill_in 'name', with: 'Sharkie'
      fill_in 'description', with: 'coolest hammock'
      fill_in 'price_per_night', with: '1000'
      click_button 'List!'
      expect(page).to have_content('Sharkie')
      expect(page).to have_content('coolest hammock')
      expect(page).to have_content('1000')
    end
end