require 'user'

feature 'Sign Out' do
  scenario 'user can sign out' do
    User.create('test@example.com', 'password123', 'testname', 'testusername')
    visit('/sessions/new')
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign In')

    click_link('Sign Out')

    expect(page).to_not have_content 'Welcome testusername!'
    expect(page).to have_content 'Welcome Guest!'
  end
end
