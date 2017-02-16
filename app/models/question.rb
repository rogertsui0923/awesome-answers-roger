class Question < ApplicationRecord

  #this sets up one-to-many association between the question and the answer in this case a question has many answers (note that to set a one-to-many association you will have to pluralize 'answer' - Rails convention)
  # we will have many handy methods to help us query associated records. for instance we can do: q = Question.last; answers = q.answers
  # the line above will fetch all the answers associated with question: q
  # it's highly recomended that you add the 'dependent' option to the association which tells Rails what to do when you delete a question that has answers associated with it, the most popular options are:
  # destroy: which will delete all associated answers before deleteing the question
  # nullify: which will update all the 'question_id' fields on the associated answers to become 'NULL' before deleting the question
  has_many :answers, lambda { order(created_at: :desc) }, dependent: :destroy
  belongs_to :user

  validates(:title, { presence: { message: 'must be given!' },
                      uniqueness: true })
  validates(:body, { presence: true, length: {minimum: 3} })
  validates(:view_count, { presence: true, numericality: { greater_than_or_equal_to: 0 } })
  validate :no_monkey

  after_initialize(:set_view_count)

  private
  def no_monkey
    if title.present? && title.downcase.include?('monkey')
      errors.add(:title, "No monkeys please!")
    end
  end

  def set_view_count
    self.view_count ||= 0;
  end


end
