feature 'Feature: add_space:' do
  scenario 'user navigates to add space form' do
    visit ('/')
    click_button 'Add Space'
    expect(page).to have_field 'space_name'
    expect(page).to have_field 'space_description'
    expect(page).to have_field 'price_per_night'
    expect(page).to have_button 'Add'
  end

  scenario 'user adds a space' do
    visit ('/')
    click_button 'Add Space'
    fill_in 'space_name', with: 'Cosy Cottage'
    fill_in 'space_description', with: 'Extremely cosy cottage in the woods'
    fill_in 'price_per_night', with: '70'
    click_button 'Add'
    expect(page).to have_content 'Congratulations you\'ve added a new space!'
  end

end
