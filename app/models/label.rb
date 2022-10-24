class Label < ApplicationRecord
  belongs_to :user
  has_many :notes
  validates :title, presence: true, length: { maximum: 20 }
end