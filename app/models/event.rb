class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validates :max_participants, presence: true

  belongs_to :studio
  has_and_belongs_to_many :users
end
