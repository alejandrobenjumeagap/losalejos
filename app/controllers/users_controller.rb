class UsersController < ApplicationController
  before_action :set_user, only: [:update]

  # PATCH/PUT /users/:user_id
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors,
             status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:rsvp)
    end
end
