# frozen_string_literal: true

class CreatecommentReflex < ApplicationReflex

  def create
    binding.pry
    @comment = Comment.new({ description: params[:description], publication_id: params[:publication_id], user_id: current_user.id })

  end

end
