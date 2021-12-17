require 'user'

feature 'login' do
  scenario 'a user who has signed up can login' do
    pw = 'secret'
    test_user = User.add_user(username: 'test_username', email: 'test@gmail.com', fullname: 'Tesy Test', pw: 'secret')

    visit ('/')
    click_button('login')
    fill_in 'username', with: test_user.username
    fill_in 'password', with: pw
    click_button('login')

    expect(current_path).to eq '/main_view'
  end
  
  scenario 'a user sees error message when using a non-existent username' do
    pw = 'secret'
    test_user = User.add_user(username: 'test_username', email: 'test@gmail.com', fullname: 'Tesy Test', pw: 'secret')

    visit ('/')
    click_button('login')
    fill_in 'username', with: 'test_username2'
    fill_in 'password', with: pw
    click_button('login')

    expect(current_path).to eq '/login'
    expect(page).to have_content 'Username does not exist'
  end

  scenario 'a user sees error message when inputting a wrong password for a given username' do
    pw = 'secret'
    test_user = User.add_user(username: 'test_username', email: 'test@gmail.com', fullname: 'Tesy Test', pw: 'secret')

    visit ('/')
    click_button('login')
    fill_in 'username', with: test_user.username
    fill_in 'password', with: 'secret2'
    click_button('login')

    expect(current_path).to eq '/login'
    expect(page).to have_content 'Password does not match'
  end
end
