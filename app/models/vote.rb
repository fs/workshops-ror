class Vote < ActiveRecord::Base
  belongs_to :choice
  belongs_to :user

  scope :by_choice, lambda {|choice| where('choice_id = ?', choice.id) }
  scope :by_user, lambda {|user| where('user_id = ?', user.id) }
end
