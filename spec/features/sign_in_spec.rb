require 'user'

feature 'user can sign in' do
  scenario 'a user can click a sign in button' do
    visit 'space_hammocks'
    expect(page).to have_link 'Sign In'
    expect(page).to have_content 'Welcome Guest'
  end

  scenario 'a user signs in using a form' do
    User.create('test2@email.com', 'test', 'testname', 'testusername')
    visit '/sessions/new'
    fill_in 'email', with: 'test2@email.com'
    fill_in 'password', with: 'test'
    click_button 'Sign In'
    expect(page).to have_content 'Welcome testusername!'
  end
end