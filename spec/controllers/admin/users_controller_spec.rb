require 'rails_helper'
require 'spec_helper'

RSpec.describe Admin::UsersController, type: :controller do
  let!(:user)           { create(:user) }

  context "As a logged in regular user" do
    login_user 

    after(:each) do
      expect(response.status).to eq(302)
    end

    describe "index" do
      it "shouldn't allow us to access the index page" do
        get :index
        expect(response).to redirect_to(root_url)
      end  
    end

    describe "create" do
      it "shouldn't let us create a user" do
        expect {
          post :create, :user => user.attributes
        }.to change{ User.count }.by(0)
      end
    end
  end

  context "As a logged in admin user" do
    login_admin 

    describe "index" do
      let!(:users)        { create_list(:user, 5) }

      it "should list all the users (first page)" do
        get :index
        expect(response).to render_template(:index)
        expect(response.status).to eq(200)
        expect(assigns(:users).size).to eq(5)   
      end

      it "should list all the users (2nd page)" do
        get :index, page: 2
        expect(response).to render_template(:index)
        expect(response.status).to eq(200)
        expect(assigns(:users).size).to eq(2)         #login_admin also creates a user   
      end
    end

    describe "create" do
      xit "should let us create a company" do
        expect(company).to be_valid      
        expect {
          post :create, :company => company.attributes
        }.to change{ Company.count }.by(1)
        expect(response.status).to eq(302)
        expect(response).to redirect_to(companies_path)
      end

      xit "should set the error array" do
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
      xit "should let us edit a company" do
        expect(company).to be_valid      
        company.name = company.name + "_new"    
        expect {
          patch :update, id: company.id, :company => company.attributes
        }.to change{ Company.count }.by(0)
        expect(response.status).to eq(302)
        expect(response).to redirect_to(companies_path)
      end

      xit "should set the error array" do
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
