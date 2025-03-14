class Poem < ApplicationRecord
  belongs_to :user

  validates :title, :aroma, :location, :content, presence: true
end
