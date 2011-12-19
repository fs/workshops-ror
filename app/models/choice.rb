class Choice < ActiveRecord::Base
  belongs_to :decision
  has_many :votes, dependent: :destroy

  validates :title, presence: true, length: {minimum: 3}

  def vote!(user)
    if decision.user_voted?(user)
      false
    else
      votes.build(user: user).save
    end
  end
end
