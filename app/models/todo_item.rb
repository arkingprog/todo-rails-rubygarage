class TodoItem < ActiveRecord::Base


  belongs_to :todo_list



  def completed?
    !completed_at.blank?
  end

  def priority?
    if priority==0
      false
    else
      true
    end
  end
end
