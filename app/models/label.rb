class Label < ApplicationRecord
  belongs_to :user
  has_many :notes, dependent: :destroy
  validates :title, presence: true, length: { maximum: 20 }
  validates_uniqueness_of :title, scope: :user
end
