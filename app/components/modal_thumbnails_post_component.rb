# frozen_string_literal: true

class ModalThumbnailsPostComponent < ViewComponent::Base
  attr_reader :publication_content
  def initialize(publication_content:)
    @publication_content = publication_content
  end

end
