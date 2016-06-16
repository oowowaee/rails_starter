require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  describe "validation" do
    let(:user) { create(:user) }

    it "should be created properly by the factory" do
      expect(user).to be_valid  
    end

    it "should require a name" do
      user.name = nil
      expect(user).not_to be_valid
    end

    it "should require a minimum length" do
      user.name = 'abc'
      expect(user).not_to be_valid      
    end

    it "should require an email" do
      user.email = nil
      expect(user).not_to be_valid      
    end
  end
end
