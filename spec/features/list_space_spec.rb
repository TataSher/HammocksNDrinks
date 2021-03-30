feature 'list a space hammock' do
  scenario 'a user-owner want to list their space-hammock for rent' do
    visit '/space_hammocks'
    click_button 'List my Space Hammock'
    expect(page).to have_current_path('/space_hammocks/new')
    fill_in 'name', with: 'Neptune Blues'
    fill_in 'description', with: 'Enjoy your luxury holiday on the idyllic planet of Neptune, at Neptune Blues you can while your worries away while drinking our famous Gas Seas Sparkling Methane.'
    fill_in 'price_per_night', with: '1000'
    click_button 'List!'
    expect(page).to have_current_path('/space_hammocks')
    expect(page).to have_content("Neptune Blues")
  end
end
