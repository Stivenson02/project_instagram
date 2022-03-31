# frozen_string_literal: true

class ShowPublicationsComponent < ViewComponent::Base

  attr_reader :publications, :current_user

  def initialize(publications:, current_user:)
    @publications = publications
    @current_user = current_user
  end

  def show_post(publication)
    publication.publication_contents.count <= 0 ? show_edit(publication) : publication.post?
  end

  def show_img(publication)
    if publication.publication_contents.count > 0
      publication.publication_contents.order(order: :asc).first.file
    else
      if publication.reel?
        "https://puntoambar.com/wp-content/uploads/2021/02/razones-incorporar-reels-en-tu-estrategia.jpg"
      elsif publication.history?
        "https://thumbs.dreamstime.com/b/history-doodles-lettering-white-background-137829155.jpg"
      else
        "https://is4-ssl.mzstatic.com/image/thumb/Purple126/v4/58/8a/ed/588aeda0-dc05-3978-ce6e-231d294b2c97/AppIcon-0-2x_U007euniversal-0-4-0-85-220.png/1200x600bf.png"
      end
    end
  end
  def show_edit(publication)
    if @current_user.id == publication.user_id
      true
    else
      false
    end
  end

end
