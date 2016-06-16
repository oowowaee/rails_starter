require 'rails_helper'
require 'spec_helper'

RSpec.describe Company, type: :model do
  describe "validation" do
    let(:company) { build(:company) }

    it "should be created properly by the factory" do
      expect(company).to be_valid  
    end

    it "should require a name" do
      company.name = nil
      expect(company).not_to be_valid
    end

    it "should require a minimum length" do
      company.name = nil
      expect(company).not_to be_valid      
    end
  end
end
