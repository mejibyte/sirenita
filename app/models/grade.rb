class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :activity
  
  validates :student_id, :activity_id, :presence => true
end
