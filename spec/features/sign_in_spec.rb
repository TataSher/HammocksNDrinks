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

  scenario 'error with wrong email' do
    User.create('test3@email.com', 'test3', 'testname3', 'testusername3')
    visit('/sessions/new')
    fill_in(:email, with: 'notrightemail@example.com')
    fill_in(:password, with: 'test3')
    click_button('Sign In')

    expect(page).to_not have_content 'Welcome testusername3!'
    expect(page).to have_content 'Please check your email or password'
  end

  scenario 'error with wrong password' do
    User.create('test4@email.com', 'test4', 'testname4', 'testusername4')
    visit('/sessions/new')
    fill_in(:email, with: 'test4@email.com')
    fill_in(:password, with: 'wrongpass')
    click_button('Sign In')

    expect(page).to_not have_content 'Welcome testusername4!'
    expect(page).to have_content 'Please check your email or password.'
  end
end