# frozen_string_literal: true

class PostformReflex < ApplicationReflex
  def create
    publication_id= element.dataset.value.to_i
    @count_order= Publication.find(publication_id).publication_contents.count +1
    @publication_content = PublicationContent.new
    if @count_order > 8
      morph "#testmorp", "Hello"
    end
  end
end
