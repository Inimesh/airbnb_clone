feature 'Feature: add_space:' do
  scenario 'user navigates to add space form' do
    visit ('/')
    sign_up
    click_button 'Add Space'
    expect(page).to have_field 'space_name'
    expect(page).to have_field 'space_description'
    expect(page).to have_field 'price_per_night'
    expect(page).to have_field 'stay_start'
    expect(page).to have_field 'stay_finish'
    expect(page).to have_button 'Add'
  end

  scenario 'user adds a space' do
    visit ('/')
    sign_up
    add_space
    expect(page).to have_content 'Cosy Cottage'
    expect(page).to have_content 'Extremely cosy cottage in the woods'
  end

  # scenario 'user adds a without specifying availability' do
  #   visit ('/')
  #   sign_up
  #   add_space
  #   expect(page).to have_content 'Cosy Cottage'
  #   expect(page).to have_content 'Extremely cosy cottage in the woods'
  # end

end
