class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :activity
  
  validates :student_id, :activity_id, :presence => true
  
  validates_numericality_of :grade, :less_than_or_equal_to => 5.0, :greater_than_or_equal_to => 0.0, :allow_nil => true
end
