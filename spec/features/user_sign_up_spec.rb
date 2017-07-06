require 'rails_helper'

describe "the add a user process" do
  it "adds a new user" do
    visit new_user_path
    user = FactoryGirl.create(:user)
    fill_in 'Name', with: 'Qwerty Jr'
    fill_in 'Email', with: 'qwertyjr@email.com'
    click_on 'Create User'
    expect(page).to have_content "You've successfully signed up!"
  end
end
