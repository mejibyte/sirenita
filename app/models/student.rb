# encoding: utf-8
class Student < ActiveRecord::Base
  validates :name, :presence => true
  validates :code, :presence => true, :format => { :with => /^[0-9]{12}$/, :message => "debe estar formado por 12 números" }
  validates :email, :presence => true, :format => { :with => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i, :message => "no es una dirección de email válida" }
  
  has_many :grades, :dependent => :destroy
  
  def evaluated_percentage
    grades.select { |g| g.grade.present? }.map(&:activity).inject(0) { |sum, activity| sum + activity.percentage }
  end
  
  def first_name
    name.split.first
  end
  
  def grade_for(some_activity)
    grades.where(:activity_id => some_activity.id).first || Grade.new(:student_id => self.id, :activity_id => some_activity.id)
  end
  
  def weighted_average
    present_grades = grades.select { |g| g.grade.present? }
    return "-" if present_grades.empty?
    answer = 0.0
    present_grades.each do |grade|
      answer += grade.grade * grade.activity.percentage / 100.0
    end
    answer.round(2)
  end
end
