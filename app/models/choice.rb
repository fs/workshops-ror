class Choice < ActiveRecord::Base
  belongs_to :decision

  validates :title, presence: true, length: {minimum: 3}
end
