class PublicationContentsController < ApplicationController
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
    @publication_content = PublicationContent.new(publication_content_params)

    respond_to do |format|
      if @publication_content.save
        format.html { redirect_to publication_content_url(@publication_content), notice: "Publication content was successfully created." }
        format.json { render :show, status: :created, location: @publication_content }
      else
        format.html { render :new, status: :unprocessable_entity }
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
    @publication_content.destroy

    respond_to do |format|
      format.html { redirect_to publication_contents_url, notice: "Publication content was successfully destroyed." }
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
      params.require(:publication_content).permit(:file, :description, :order, :type, :publication_id)
    end
end
