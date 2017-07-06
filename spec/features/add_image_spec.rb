require 'rails_helper'

describe "add a new image" do
  it "adds a new image" do
    visit root_path
    user = FactoryGirl.create(:user)
    click_on 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    click_on 'Submit Image'

    expect(page).to have_content "You've successfully signed up!"
  end
end
