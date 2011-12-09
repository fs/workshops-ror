class Decision < ActiveRecord::Base
  validates :subject, :description, presence: true
  validates :subject, legth: {minimun: 8}
  validates :description, legth: {minimun: 15}
end
