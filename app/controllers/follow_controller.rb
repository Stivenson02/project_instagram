class FollowController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile
  before_action :set_follow, only: [:show, :destroy]
  def create
    @follow=Follow.new({follower_id: @profile.user_id,  user_id: current_user.id})
    respond_to do |format|
      if @follow.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("profile-user-#{@profile.id}",
                                partial: "profiles/follow",
                                locals: { profile: @profile } )
          ]
        end
        format.html { redirect_to profiles_url(@profile), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def destroy
    respond_to do |format|
      if @follow.destroy
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("profile-user-#{@profile.id}",
                                partial: "profiles/follow",
                                locals: { profile: @profile } )
          ]
        end
        format.html { redirect_to profiles_url(@profile), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }

      end
    end
  end

  def set_profile
    @profile= Profile.find(params[:profile_id])
  end

  def set_follow
    @follow =  Follow.find(params[:id])
  end
end
