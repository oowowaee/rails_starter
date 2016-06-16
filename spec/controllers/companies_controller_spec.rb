require 'rails_helper'
require 'spec_helper'

RSpec.describe CompaniesController, type: :controller do
  let!(:company)          { create(:company) }

  context "As a logged in regular user" do
    login_user 

    describe "index" do
      let!(:companies)    { create_list(:company, 5) }

      it "should list all the companies (first page)" do
        get :index
        expect(response).to render_template(:index)
        expect(response.status).to eq(200)
        expect(assigns(:companies).size).to eq(5)   
      end

      it "should list all the companies (2nd page)" do
        get :index, page: 2
        expect(response).to render_template(:index)
        expect(response.status).to eq(200)
        expect(assigns(:companies).size).to eq(1)   
      end
    end

    describe "create" do
      it "should let us create a company" do
        expect(company).to be_valid      
        expect {
          post :create, :company => company.attributes
        }.to change{ Company.count }.by(1)
        expect(response.status).to eq(302)
        expect(response).to redirect_to(companies_path)
      end

      it "should set the error array" do
        company.name = nil
        expect(company).not_to be_valid      
        expect {
          post :create, :company => company.attributes
        }.to change{ Company.count }.by(0)
        expect(assigns(:errors).size).to eq(2)
        expect(response.status).to eq(200)
        expect(response).to render_template(:new)
      end
    end

    describe "update" do
      it "should let us edit a company" do
        expect(company).to be_valid      
        company.name = company.name + "_new"    
        expect {
          patch :update, id: company.id, :company => company.attributes
        }.to change{ Company.count }.by(0)
        expect(response.status).to eq(302)
        expect(response).to redirect_to(companies_path)
      end

      it "should set the error array" do
        company.name = nil
        expect(company).not_to be_valid      
        expect {
          patch :update, id: company.id, :company => company.attributes
        }.to change{ Company.count }.by(0)
        expect(assigns(:errors).size).to eq(2)
        expect(response.status).to eq(200)
        expect(response).to render_template(:show)
      end
    end
  end
end
