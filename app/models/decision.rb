class Decision < ActiveRecord::Base
  has_many :choices, dependent: :destroy
  has_many :votes, through: :choices, source: :votes
  belongs_to :user

  validates :subject, :description, presence: true
  validates :subject, length: {minimum: 8}
  validates :description, length: {minimum: 15}

  scope :by_user, lambda { |user| where(user_id: user.id) }

  def total_votes
    votes.count
  end

  def votes_by(choice)
    votes.by_choice(choice).count
  end

  def owned_by?(u)
    user == u
  end
end
