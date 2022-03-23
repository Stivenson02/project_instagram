class Profile < ApplicationRecord
  has_one_attached :avatar
  validates :username, :avatar, :description, :phone_number, presence: true
  belongs_to :user
end
