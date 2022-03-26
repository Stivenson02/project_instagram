# frozen_string_literal: true

class FormContentComponent < ViewComponent::Base

  attr_reader :publication_content, :publication


  def initialize(publication_content:, publication:)
    @publication_content = publication_content
    @publication = publication
  end

  def new
    @publication_content = PublicationContent.new
  end

end
