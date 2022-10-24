class Note < ApplicationRecord
  belongs_to :user
  belongs_to :label
  validates :head, presence: true, length: { maximum: 30 }
end
