require './spec/spec_helper.rb'
require './makers_hnd_web_app.rb'
feature 'list all space hammocks' do
    scenario 'list one space hammock' do
      visit '/hammocks_listings'
      expect(page).to have_content('Best Space Hammock EVER!')
    end
end