class Vote < ActiveRecord::Base
  belongs_to :choice
  belongs_to :user

  scope :by_choice, lambda {|choice| where('choice_id = ?', choice.id) }
end
