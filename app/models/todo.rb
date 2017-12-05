class Todo < ActiveRecord::Base
  belongs_to :user, :optional => true

  def completed?
    !completed_at.blank?
  end
end
