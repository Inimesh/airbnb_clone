require_relative './../web_helper'

feature 'Add booking request i.e. book a space for a given date' do
  scenario 'Can click on a space to start a booking request' do

    space_id = add_user_space_and_avaliability

    visit('/main_view')
    expect(page).to have_content 'Cozy Cottage'
    click_on 'Book'
    expect(current_path).to eq "/booking/#{space_id}/book"
  end

  scenario 'Can create a booking request' do

    space_id = add_user_space_and_avaliability

    visit("/booking/#{space_id}/book")

    check '2022-01-02'
    check '2022-01-03'
    click_on 'Request'
    
    expect(current_path).to eq '/main_view'
    expect(page).to have_content "Your request for Cozy Cottage has been submitted to the host for the following dates: 2022-01-02, 2022-01-03"
  end
end
