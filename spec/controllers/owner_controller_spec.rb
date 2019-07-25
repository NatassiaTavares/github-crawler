require 'rails_helper'

RSpec.describe OwnerController, type: :controller do
  before :each do
    @owner_id = create(:owner)
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, { :format => @owner_id }
      expect(response).to have_http_status(:success)
    end
  end
end