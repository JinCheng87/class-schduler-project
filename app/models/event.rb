class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validates :max_participants, presence: true

  belongs_to :studio
  has_many :users, through: :event_registration
end
