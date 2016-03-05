class Question < ActiveRecord::Base

  belongs_to  :quizz
  belongs_to  :word

  scope :done,           -> { where(done: true) }
  scope :not_done,       -> { where(done: false) }
  scope :good_answered,  -> { where(result: true) }
  scope :wrong_answered, -> { where(result: false) }

end
