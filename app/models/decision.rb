class Decision < ActiveRecord::Base
  has_many :choices, dependent: :destroy
  has_many :votes, through: :choices, source: :votes
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :subject, :description, presence: true
  validates :subject, length: {minimum: 8}
  validates :description, length: {minimum: 15}

  def total_votes
    votes.count
  end

  def votes_count_for(choice)
    votes.by_choice(choice).count
  end

  def user_voted?(user)
    votes.by_user(user).count > 0
  end

  def owned_by?(u)
    user == u
  end
end
