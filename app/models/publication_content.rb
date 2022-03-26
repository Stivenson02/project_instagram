class PublicationContent < ApplicationRecord
  has_one_attached :file
  validates :file, :description,:content_type,:order, :publication_id, presence: true
  belongs_to :publication

  validates :content_type, inclusion: { in: ['img', 'video'] }

  TYPE_OPTIONS = [
    ['Image', 'img'],
    ['Video', 'video']
  ]
end
