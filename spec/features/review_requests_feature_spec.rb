feature 'review requests for spaces owned by the user' do
  scenario 'user approves a request' do
    space_id = add_user_space_and_avaliability

    visit("/booking/#{space_id}/book")

    check '2022-01-02'
    check '2022-01-03'
    click_on 'Request'

    visit('/review-requests')

    check '2022-01-03'
    click_on 'Approve'

    expect(page).to have_content('2022-01-02')
    expect(page).not_to have_content('2022-01-03')

  end
  
end
