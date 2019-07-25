require 'rails_helper'

RSpec.describe OwnersController, type: :controller do
  before :each do
    @owner = Owner.any? ? Owner.first : create(:owner)
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: @owner.id }
      expect(response).to have_http_status(:success)
    end
  end
end