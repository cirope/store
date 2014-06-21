module Feedbacks::Steps
  extend ActiveSupport::Concern

  included do
    validates :notes, presence: true, if: :check_for_notes?
  end

  def current_step
    if score.blank?
      'score'
    elsif notes.blank?
      'notes'
    else
      'thanks'
    end
  end

  private

    def check_for_notes?
      current_step == 'notes' && score_was.present?
    end
end
