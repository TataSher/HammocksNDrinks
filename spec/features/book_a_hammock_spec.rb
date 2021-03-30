feature 'book a hammock' do
  scenario 'able to click and book hammock' do
    SpaceHammock.create('test_name', 'test_description', 50, 1)
    visit '/space_hammocks'
    click_button 'Book'
    expect(page).to have_current_path('/space_hammocks/1/book')
    click_button 'Confirm Booking'
    expect(page).to have_content("Successfully booked test_name!")
  end
end
