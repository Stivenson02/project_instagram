# frozen_string_literal: true

class ModalShowPostComponent < ViewComponent::Base
  attr_reader :publication

  def initialize(publication:)
    @publication = publication
  end

end
