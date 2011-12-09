class User < ActiveRecord::Base
  has_many :votes
  has_many :decisions
end
