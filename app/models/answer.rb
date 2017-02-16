class Answer < ApplicationRecord
  belongs_to :question
  # this gives us handy methods on the Answer model to query associated questions.
  # We will be able to do something like:
  # a = Answer.last
  # q = a.question

  validates :body, presence: true
end
