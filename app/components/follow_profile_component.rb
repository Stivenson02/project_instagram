# frozen_string_literal: true

class FollowProfileComponent < ViewComponent::Base
  def initialize(profile:, current_user:)
    @profile = profile
    @current_user = current_user
  end

  def show_follow
    @current_user.follows.where(follower_id: @profile.user_id).any?
  end

  def follow
    @current_user.follows.where(follower_id: @profile.user_id).first
  end

end
