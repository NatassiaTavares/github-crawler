require 'rails_helper'

RSpec.describe OwnersController, type: :controller do
  before :each do
    @owner = Owner.first ||= create(:owner)
  end

  describe "GET #show" do
    it "returns http success" do
      visit owner_path(@owner.id)
      page.should have_content(@owner.login)
    end
  end
end