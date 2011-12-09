class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :decision

  validates :body, presence: true, length: {mininum: 3, maximum: 120}
  validates :user, :decision, presence: true

  scope :recent, limit(5).order('created_at DESC')
end
