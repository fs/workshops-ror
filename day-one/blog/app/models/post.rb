class Post < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 4, maximum: 20},
            uniqueness: true
  validates :title, format: {:with => /^\w+$/i,
                             :message => "can only contain letters and numbers."}
  validates :body, presence: true, length: { within: (10..300) }

  has_many :comments, dependent: :destroy
end
