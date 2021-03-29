require './spec/spec_helper.rb'
require './makers_hnd_web_app.rb'
feature 'list all space hammocks' do
    scenario 'list one space hammock' do
      visit '/hammocks_listings'
      expect(page).to have_content('Sharkie')
      expect(page).to have_content('coolest hammock')
      expect(page).to have_content('1000')
      expect(page).to have_content('Lou')
    end
end