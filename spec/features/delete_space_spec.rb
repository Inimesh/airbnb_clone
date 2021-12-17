feature 'Feature: delete_space:' do

  scenario 'user deletes space' do

    visit ('/')
    sign_up
    add_space
    click_button 'Add Space'
    fill_in 'space_name', with: 'Hole in the Wall'
    fill_in 'space_description', with: 'Cold & Dirty'
    fill_in 'price_per_night', with: '5'
    fill_in 'stay_start', with: '2021-12-16'
    fill_in 'stay_finish', with: '2021-12-18'
    click_button 'Add'
    expect(page).to have_content 'Cosy Cottage'
    expect(page).to have_content 'Hole in the Wall'
    within '#space-block-1' do
      click_button 'Delete'
    end
    expect(page).not_to have_content 'Cosy Cottage'
    expect(page).to have_content 'Hole in the Wall'
  
  end

end
