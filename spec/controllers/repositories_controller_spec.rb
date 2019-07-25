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
      visit repository_path(@repository.id)
      page.should have_content(@repository.name)  
    end
  end

end
