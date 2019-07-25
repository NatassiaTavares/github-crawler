require 'rails_helper'

RSpec.describe RepositoriesController, type: :controller do
  before :all do
    @repository = Repository.first ||= create(:repository)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: @repository.id }
      expect(response).to have_http_status(:success) 
    end
  end
end