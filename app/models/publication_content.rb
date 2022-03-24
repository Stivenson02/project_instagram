class PublicationContent < ApplicationRecord
  has_one_attached :file
  validates :file, :description,:content_type,:order, presence: true
  belongs_to :publication
end
