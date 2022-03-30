# frozen_string_literal: true

class ModalCommentPostComponent < ViewComponent::Base
  attr_reader :publication
  def initialize(publication:)
    @publication = publication
  end

  def new_comment()
    Comment.new
  end

end
