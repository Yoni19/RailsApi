class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :current_user_can_modify_and_delete, only: [:update, :destroy]
  def index
    @users = User.all.map { |user| public_info(user) }

    render json: @users
  end

  def show
    render json: public_info(@user)
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: { error: @user.errors }, status: :unprocessable_entity
    end
  end

 
  def destroy
    id = @user.id
    @user.destroy
    render json: { id: id, status: 'user deleted' }
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username)
    # in postman, to write body in "raw" that contains a scope, do key; user[something]
  end

  def public_info(user)
    {
      id: user.id,
      username: user.username,
      first_name: user.first_name,
      last_name_initial: user.last_name[0]
    }
  end

  def current_user_can_modify_and_delete
    if current_user != @user
      render json: { error: "Unauthorized", detail: "Can only do this to one's own profile" }
    end
  end
end
