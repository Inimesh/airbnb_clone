feature 'Feature: edit_space:' do

  scenario 'user navigates to edit space page' do

    visit ('/')
    sign_up
    add_space
    within '#space-block-1' do
      click_button 'Edit'
    end
    expect(page).to have_content 'Cosy Cottage'
    expect(page).to have_content 'Update Cosy Cottage Details'
    expect(page).to have_content 'Add Cosy Cottage Availability'
    expect(page).to have_content '2021-12-16'
    expect(page).to have_content '2021-12-17'
    expect(page).to have_content '2021-12-18'
    expect(page).to have_field 'space_name'
    expect(page).to have_field 'space_description'
    expect(page).to have_field 'price_per_night'  
    expect(page).to have_field 'stay_start'
    expect(page).to have_field 'stay_finish'
    expect(page).to have_button 'Update'
    expect(page).to have_button 'Add'
    
  end

  scenario 'user edits space details' do

    visit ('/')
    sign_up
    add_space
    within '#space-block-1' do
      click_button 'Edit'
    end
    fill_in 'space_name', with: 'Luxury Penthouse'
    fill_in 'space_description', with: 'Only For The Rich & Famous!'
    fill_in 'price_per_night', with: '500'
    click_button 'Update'
    within '#space-block-1' do
      click_button 'Edit'
    end
    expect(page).not_to have_content 'Cosy Cottage'
    expect(page).not_to have_content 'Update Cosy Cottage Details'
    expect(page).not_to have_content 'Add Cosy Cottage Availability'
    expect(page).to have_content 'Luxury Penthouse'
    expect(page).to have_content 'Only For The Rich & Famous!'
    expect(page).to have_field('price_per_night', with: '$500.00')
  
  end

  scenario 'user adds space availability' do
    visit ('/')
    sign_up
    add_space
    within '#space-block-1' do
      click_button 'Edit'
    end
    fill_in 'stay_start', with: '2022-06-01'
    fill_in 'stay_finish', with: '2022-06-03'
    click_button 'Add'
    within '#space-block-1' do
      click_button 'Edit'
    end
    expect(page).to have_content '2022-06-01'
    expect(page).to have_content '2022-06-02'
    expect(page).to have_content '2022-06-03'
  end

  scenario 'user removes space availability' do
    visit ('/')
    sign_up
    add_space
    within '#space-block-1' do
      click_button 'Edit'
    end
    fill_in 'stay_start', with: '2022-06-01'
    fill_in 'stay_finish', with: '2022-06-03'
    click_button 'Add'
    within '#space-block-1' do
      click_button 'Edit'
    end
    find_by_id('delete-availability-2022-06-01').click_button 'Delete'
    within '#space-block-1' do
      click_button 'Edit'
    end
    find_by_id('delete-availability-2022-06-03').click_button 'Delete'
    within '#space-block-1' do
      click_button 'Edit'
    end 
    expect(page).not_to have_content '2022-06-01'
    expect(page).to have_content '2022-06-02'
    expect(page).not_to have_content '2022-06-03'
  end

end
