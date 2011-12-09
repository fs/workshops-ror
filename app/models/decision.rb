class Decision < ActiveRecord::Base
  has_many :choices, dependent: :destroy

  validates :subject, :description, presence: true
  validates :subject, length: {minimum: 8}
  validates :description, length: {minimum: 15}
end
