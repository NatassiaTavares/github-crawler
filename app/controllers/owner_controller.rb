class OwnerController < ApplicationController
  def show
    @owner = Owner.find(params[:id])
  end
end
