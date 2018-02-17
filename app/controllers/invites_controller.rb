class InvitesController < ApplicationController
  before_action :set_invite, only: [:get_details, :update_user]

  # GET /invites/token/:token
  def get_details
    if @invite.present?
      meta_data = {
        total_accepted_invites: User.by_rsvp(1).size
      }
      render json: @invite,
              meta: meta_data
    else
      render status: :not_found
    end
  end

  # PATCH/PUT /users/:user_id
  def update_user
    # binding.pry
    user = @invite.users.find(params[:user_id])

    return render status: :not_found unless user.present?

    if user.update(patch_params)
      render json: user,
             include: []
    else
      render json: user.errors,
             status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invite
      @invite = Invite.find_by_token(params[:token])
    end

    # Only allow a trusted parameter "white list" through.
    def patch_params
      params.permit(:rsvp)
    end
end
