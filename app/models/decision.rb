class Decision < ActiveRecord::Base
  has_many :choices, dependent: :destroy
  has_many :votes, through: :choices, source: :votes

  validates :subject, :description, presence: true
  validates :subject, length: {minimum: 8}
  validates :description, length: {minimum: 15}

  def total_votes
    votes.count
  end

  def votes_by(choice)
    votes.by_choice(choice).count
  end
end
