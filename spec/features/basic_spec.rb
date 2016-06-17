require 'rails_helper'
require 'spec_helper'
require 'capybara/rspec'

RSpec.describe 'a test to check you can navigate the lists' do
  let!(:companies)      { create_list(:company, 5) }
  let!(:user)           { create(:user) }
  let!(:admin)          { create(:admin) }

  it "should navigate the app" do
    login_user(user)

    companies.each do |company|
      expect(page).to have_content(company.name)
    end
  end

  it "should let us create, confirm and sign in a new user" do
    login_user(admin)

    visit admin_users_path
    expect(page).to have_content(I18n.t('user.heading')) 

    find_link(t('user.add')).click
    fill_in("user_email", with: "newuser@test.com")
    fill_in("user_name", with: "New User Name")

    expect { click_button("Save User") }.to change(ActionMailer::Base.deliveries, :count).by(1)

    find_link("Logout").click
    expect(page).to have_content("Log in")
    visit_activation_link

    fill_in("user_password", with: "newpassword")
    fill_in("user_password_confirmation", with: "newpassword")
    click_button("Activate")

    expect(page).to have_content("Your email address has been successfully confirmed.")

    find_link("Logout").click

    visit new_user_session_path

    fill_in("user_email", with: "newuser@test.com")
    fill_in("user_password", with: "newpassword")
    click_button(t('form.login'))

    expect(page).to have_content("Companies")
  end
end