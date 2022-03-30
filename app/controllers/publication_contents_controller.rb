class PublicationContentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_publication_content, only: %i[ show edit update destroy ]

  # GET /publication_contents or /publication_contents.json
  def index
    @publication_contents = PublicationContent.all
  end

  # GET /publication_contents/1 or /publication_contents/1.json
  def show
  end

  # GET /publication_contents/new
  def new
    @publication_content = PublicationContent.new
  end

  # GET /publication_contents/1/edit
  def edit
  end

  # POST /publication_contents or /publication_contents.json
  def create
    @publication = Publication.find(params[:publication_content][:publication_id])
    order = @publication.publication_contents.count + 1
    save_content = false
    if @publication.post? && order < 11
      save_content = true
    elsif @publication.reel? && order < 2
      save_content = true
    elsif @publication.history? && order < 2
      save_content = true
    end

    @publication_content = PublicationContent.new(publication_content_params)
    @publication_content.order = order
    respond_to do |format|
      if @publication_content.save && save_content
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update('publication_content_form',
                                partial: "publication_contents/form",
                                locals: { publication_content: PublicationContent.new }),
            turbo_stream.prepend('publication_contents',
                                 partial: "publication_contents/publication_content",
                                 locals: { publication_content: @publication_content })
          ]
        end
        format.html { redirect_to edit_publication_url(@publication_content.publication), notice: "Publication content was successfully created." }
        format.json { render :show, status: :created, location: @publication_content.publication }
      else
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update('publication_content_form',
                                partial: "publication_contents/form",
                                locals: { publication_content: PublicationContent.new }),
            turbo_stream.update('notice', "Fill in all the fields")
          ]
        end
        format.html { redirect_to edit_publication_url(@publication_content.publication), notice: "Publication content was successfully created." }
        format.json { render json: @publication_content.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /publication_contents/1 or /publication_contents/1.json
  def update
    respond_to do |format|
      if @publication_content.update(publication_content_params)
        format.html { redirect_to publication_content_url(@publication_content), notice: "Publication content was successfully updated." }
        format.json { render :show, status: :ok, location: @publication_content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @publication_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publication_contents/1 or /publication_contents/1.json
  def destroy
    @publication = @publication_content.publication
    @publication_content.destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.remove(@publication_content),
          turbo_stream.update('publication_content_form',
                              partial: "publication_contents/form",
                              locals: { publication_content: PublicationContent.new }),
        ]
      end
      format.html { redirect_to edit_publication_url(@publication_content.publication), notice: "Publication content was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_publication_content
    @publication_content = PublicationContent.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def publication_content_params
    params.require(:publication_content).permit(:file, :description, :content_type, :publication_id)
  end
end
