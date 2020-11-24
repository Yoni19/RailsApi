class ProfilesController < ApplicationController
  before_action :set_user

  def index
    render json: @user
  end


  private

  def set_user
    @user = current_user
  end
end
