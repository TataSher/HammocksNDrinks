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
end
