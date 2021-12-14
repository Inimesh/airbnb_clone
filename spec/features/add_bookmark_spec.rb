feature 'Feature: add_bookmark:' do
  scenario 'user adds a new bookmark' do
    visit ('/')
    click_button 'View Bookmarks'
    within '.add-container' do
      fill_in 'url', with: 'https://stackoverflow.com/'
      fill_in 'title', with: 'stackoverflow'
      click_button 'Submit'
    end
    expect(page).to have_content "makers"
    expect(page).to have_content "destroyallsoftware"
    expect(page).to have_content "google"
    expect(page).to have_content "stackoverflow"
  end
end