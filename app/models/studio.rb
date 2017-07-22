class Studio < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true

  has_many :events, dependent: :destroy
  belongs_to :user
end
