# frozen_string_literal: true

class LikesComponent < ViewComponent::Base
  attr_reader :publication, :user_id

  def initialize(publication:, user_id:)
    @publication = publication
    @user_id = user_id
  end

  def show_form
    show=false
    if @publication.publication_likes.count > 0
      show=true if @publication.publication_likes.where(user_id: @user_id).any?
    end
    show
  end

  def publication_like(publication)
    @publication_like=publication.publication_likes.where(user_id: @user_id).first
  end

end
