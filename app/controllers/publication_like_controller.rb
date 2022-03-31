class PublicationLikeController < ApplicationController
  before_action :authenticate_user!
  before_action :set_publication

  def create
    @publication_like = PublicationLike.new({ publication_id: params[:publication_id], user_id: current_user.id })
    respond_to do |format|
      if @publication_like.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("publications-like-#{@publication_like.publication.id}",
                                partial: "publications/likes",
                                locals: { publication: @publication_like.publication } )
          ]
        end
        format.html { redirect_to publication_content_url(@publication_like), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @publication_like }

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @publication_like.errors, status: :unprocessable_entity }
      end
    end

  end

  def show
  end

  def destroy
    binding.pry
  end

  private

  def set_publication
    @publication = Publication.find(params[:publication_id])
  end
end
