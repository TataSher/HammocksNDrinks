feature 'book a hammock' do
  scenario 'able to click and book hammock' do
    SpaceHammock.create('test_name', 'test_description', 50, 1)
    visit '/space_hammocks'
    first('.hammock_book').click_button 'Book'
    expect(page).to have_current_path('/space_hammocks/1/book')
    click_button 'Confirm Booking'
    expect(page).to have_content("Successfully booked test_name!")
  end

  scenario 'if its already booked, then gos to a page which says it booked' do
    SpaceHammock.create('test_name', 'test_description', 50, 1)
    visit '/space_hammocks'
    first('.hammock_book').click_button 'Book'
    click_button 'Confirm Booking'
    visit '/space_hammocks'
    first('.hammock_book').click_button 'Book'
    expect(page).to have_content("test_name is already booked! Please choose another Hammock.")
  end
end
