require 'user'

feature 'login' do
  scenario 'a user who has signed up can login' do
    test_user = User.add_user(username: 'test_username', email: 'test@gmail.com', fullname: 'Tesy Test', pw: 'secret')

    visit ('/')
    click_button('login')
    fill_in 'username', with: test_user.username
    fill_in 'password', with: test_user.pw
    click_button('confirm_login')

    expect(current_path).to be '/main_view'
  end
end