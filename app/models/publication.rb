class Publication < ApplicationRecord
  belongs_to :user
  has_many :publication_contents
  has_many :comments

  validates :publication_type, inclusion: { in: ['post', 'reel', 'history'] }

  TYPE_OPTIONS = [
    ['Post', 'post'],
    ['Reel', 'reel'],
    ['History', 'history']
  ]

  def post?
    publication_type == 'post'
  end
  def reel?
    publication_type == 'reel'
  end
  def history?
    publication_type == 'history'
  end

end
