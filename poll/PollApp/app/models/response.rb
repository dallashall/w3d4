# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#

class Response < ActiveRecord::Base

  validates :user_id, :answer_choice_id, presence: true
  validate :no_duplicate_responses, :no_self_answer

  def no_duplicate_responses
    if self.respondent_already_answered?
      self.errors[:respondent] << "already answered!"
    end
  end

  def no_self_answer
    if self.question.poll.author_id == self.user_id
      self.errors[:author] << "Can't answer your own poll!"
    end
  end

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_one :question, through: :answer_choice, source: :question

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    sibling_responses
    .exists?(['responses.user_id = (?)', self.user_id])
  end

end
