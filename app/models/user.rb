class User < ActiveRecord::Base
  has_many :votes
  has_many :decisions, dependent: :destroy
  has_many :comments
  
  validates :first_name, :last_name, presence: true, length: {minimum: 3, maximum: 12}

  def fullname
   if !first_name.blank? || last_name.blank?
     [first_name, last_name].reject(&:blank?).join(' ')
   else
     email
   end
  end

end
