class Publication < ApplicationRecord
  belongs_to :user
  has_many :publication_contents
end
