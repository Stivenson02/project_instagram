class Publication < ApplicationRecord
  belongs_to :user
  has_many :publication_contents

  validates :publication_type, inclusion: { in: ['post', 'reel', 'history'] }

  TYPE_OPTIONS = [
    ['Post', 'post'],
    ['Reel', 'reel'],
    ['History', 'history']
  ]

  def post?
    publication_type == 'complete'
  end
  def reel?
    publication_type == 'in-progress'
  end
  def history?
    publication_type == 'not-started'
  end

end
