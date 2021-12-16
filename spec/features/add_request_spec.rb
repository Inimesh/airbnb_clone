require_relative './../web_helper'

feature 'Add booking request i.e. book a space for a given date' do
  scenario 'Can click on a space to start a booking request' do

    user = User.add_user(username: 'test', email: 'test@makers.co.uk', fullname: 'test user', pw: 'abc123')
    space1 = Spaces.add_space('Cozy Cottage','Very cozy','50',"#{user.user_id}")
    visit('/main_view')
    expect(page).to have_content 'Cozy Cottage'
    click_on 'Book'
    expect(current_path).to be '/booking/:space_id/book'

    # click_on dates checkbox to select dates
    # click_on 'Submit booking'
    # expect(page).to have_content 'Your booking has been requested, please wait to hear back from the host!'
  end

end
