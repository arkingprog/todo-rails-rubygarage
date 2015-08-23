class TodoItem < ActiveRecord::Base
  validates :content, length: {minimum: 3, too_short: "%{count} characters is the minimum allowed"}, presence: true

  belongs_to :todo_list



  def completed?
    !completed_at.blank?
  end

  def deadline?
    if deadline.present? && (Time.now() - deadline) < 0
      true
    else
      false
    end
  end
  def priority?
    if priority==0
      false
    else
      true
    end
  end
end
