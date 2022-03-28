# frozen_string_literal: true

class FormContentComponent < ViewComponent::Base

  attr_reader :publication_content, :publication


  def initialize(publication_content:, publication:)
    @publication_content = publication_content
    @publication = publication
  end

  def show_form
    @show=false
    if @publication.post?
      @show=true if @publication.publication_contents.count < 9
    elsif @publication.reel?
      @show=true if @publication.publication_contents.count < 2
    elsif @publication.history?
      @show=true if @publication.publication_contents.count < 1
    end
    @show
  end

  def show_end (publication)
    publication.publication_contents.any?
  end

end
