require 'user'

feature 'logout' do
  scenario 'a user who has logged in can logout' do
    test_user = User.add_user(username: 'test_username', email: 'test@gmail.com', fullname: 'Tesy Test', pw: 'secret')
    visit ('/')
    click_button('login')
    fill_in 'username', with: test_user.username
    fill_in 'password', with: 'secret'
    click_button('confirm_login')

    expect(current_path).to eq '/main_view'
    click_button('logout')
    expect(page).to have_content 'You have successfully logged out'
    expect(current_path).to eq '/'
    expect(page).not_to have_selector(:link_or_button, 'logout')
    expect(page).to have_selector(:link_or_button, 'login')
  end
end
