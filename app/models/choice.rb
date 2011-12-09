class Choice < ActiveRecord::Base
  belongs_to :decision
  has_many :votes

  validates :title, presence: true, length: {minimum: 3}

  def vote!(user)
    votes.create(user: user)
  end
end
