feature 'user can sign up' do
  scenario 'a user can click a sign up button' do
    visit 'space_hammocks'
    expect(page).to have_link 'Sign Up'
    expect(page).to have_content 'Welcome Guest'
  end

  scenario 'a user signs up using a form' do
    visit '/users/new'
    fill_in 'name', with: 'Sharkie McSharkface'
    fill_in 'username', with: 'Sharkie35'
    fill_in 'email', with: 'sharks@gmail.com'
    fill_in 'password', with: 'Shark@reC00l'
    click_button 'Sign Up'
    expect(page).to have_content 'Welcome Sharkie35!'
  end

  scenario 'a user can not sign up with same email twice' do
    User.create('test@example.com', 'password123', 'testname', 'testusername')
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'testname2')
    fill_in('username', with: 'testusername2')
    click_button('Sign Up')

    expect(page).to_not have_content "Welcome testusername2!"
    expect(page).to have_content "Email or Username already exists."
  end

  scenario 'a user can not sign up with same username twice' do
    User.create('test@example.com', 'password123', 'testname', 'testusername')
    visit '/users/new'
    fill_in('email', with: 'test2@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'testname2')
    fill_in('username', with: 'testusername')
    click_button('Sign Up')

    expect(page).to_not have_content "Welcome testusername!"
    expect(page).to have_content "Email or Username already exists."
  end
end
