require 'rails_helper'

RSpec.describe SolutionsController, type: :controller do

  describe "GET #index" do
    it "returns a successful HTTP request status code" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET #new" do
    it "returns a successful HTTP request status code" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    xit "returns a successful HTTP request status code" do
      solution = Fabricate(:solution)
      user = Fabricate(:user)
      get :show, solution: solution, user: user
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "a successful create" do
      it "saves the new user object" do
        post :create, solution: Fabricate.attributes_for(:solution)
        
        expect(Solution.count).to eq(1)
      end

      it "redirects to the solution show action" do
        post :create, solution: Fabricate.attributes_for(:solution)

        expect(response).to redirect_to solution_path(Solution.first)
      end

      it "sets the 'success' notice" do
        post :create, solution: Fabricate.attributes_for(:solution)
        
        expect(flash[:notice]).to eq('Solution was successfully created.')
      end
    end
  end

  context "an unsuccessful create" do
    it "does not save the new user object with invalid inputs" do
      post :create, solution: Fabricate.attributes_for(:solution, project_id: nil)
      expect(Solution.count).to eq(0)
    end

    xit "sets the 'failure' flash message" do
      post :create, solution: Fabricate.attributes_for(:solution, project_id: nil)
      expect(flash[:warning]).to eq('Solution has not been created.')
    end
  end 
end


