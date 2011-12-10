class User < ActiveRecord::Base
  has_many :votes
  has_many :decisions
  has_many :messages
  validates :first_name, :last_name, presence: true, length: {minimum: 3, maximum: 12}

  def fullname
    [first_name, last_name].reject(&:blank?).join(' ')
  end
end
