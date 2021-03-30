feature 'book a hammock' do
  scenario 'able to click and book hammock' do
    visit '/space_hammocks'
    click_button 'Book'
    expect(page).to have_current_path('/space_hammocks/1/book')
    expect(page).to have_content("Successfully booked!")
  end
end
