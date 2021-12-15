def sign_up
  visit('/sign-up')
  fill_in('fullname', with: 'John Smith')
  fill_in('username', with: 'smithy')
  fill_in('email', with: 'jsmith@gmail.com')
  fill_in('password', with: 'password123')
  fill_in('password_confirm', with: 'password123')
  click_on('Sign Up')
end

def add_space
  click_button 'Add Space'
  fill_in 'space_name', with: 'Cosy Cottage'
  fill_in 'space_description', with: 'Extremely cosy cottage in the woods'
  fill_in 'price_per_night', with: '70'
  fill_in 'stay_start', with: '2021-12-16'
  fill_in 'stay_finish', with: '2021-12-18'
  click_button 'Add'
end