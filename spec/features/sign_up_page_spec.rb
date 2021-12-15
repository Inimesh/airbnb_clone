feature 'sign up to MakersBnB' do
  scenario 'the user can sign up for MakersBnB' do
    visit('/sign-up')
    fill_in('name', with: 'John Smith')
    fill_in('username', with: 'smithy')
    fill_in('email', with: 'jsmith@gmail.com')
    fill_in('password', with: 'password123')
    fill_in('password_confirm', with: 'password123')

    click_on('Sign Up')
    
    expect(page).to have_content('Welcome John')
  end
end
