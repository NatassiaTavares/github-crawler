class OwnerController < ApplicationController
  def show
    @owner = Owner.find(params[:format])
  end
end
