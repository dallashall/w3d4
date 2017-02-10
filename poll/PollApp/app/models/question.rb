# == Schema Information
#
# Table name: questions
#
#  id      :integer          not null, primary key
#  text    :text             not null
#  poll_id :integer          not null
#

class Question < ActiveRecord::Base

  validates :text, :poll_id, presence: true

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :answer_choices,
   primary_key: :id,
   foreign_key: :question_id,
   class_name: :AnswerChoice

  has_many :responses, through: :answer_choices, source: :responses

  def results
    # all_answer = self
    #   .responses
    #   .group(:answer_choice_id)
    #   .select(:text, 'COUNT(*) AS res_count')

    # all_answer = self.answer_choices.includes(:responses)

    all_answer = self.answer_choices
      .select('answer_choices.*, COUNT(*) AS res_count')
      .joins(:responses)
      .group('answer_choices.id')

    result = {}
    all_answer.each do |ans|
      result[ans.text] = ans.res_count
      # result[ans.text] = ans.responses.length
    end

    result
  end

end
