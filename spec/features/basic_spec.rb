require 'rails_helper'
require 'spec_helper'
require 'capybara/rspec'

RSpec.describe 'a test to check you can navigate the lists' do
  let!(:companies) { create_list(:company, 5) }
  let!(:user) { create(:user) }

  it "should navigate the app" do
    visit companies_path
    sign_in(user)

    companies.each do |company|
      expect(page).to have_content(company.name)
    end
  end
end