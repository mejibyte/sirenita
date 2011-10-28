# encoding: utf-8
class Student < ActiveRecord::Base
  validates :name, :presence => true
  validates :code, :presence => true, :format => { :with => /^[0-9]{12}$/, :message => "debe estar formado por 12 números" }
  validates :email, :presence => true, :format => { :with => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i, :message => "no es una dirección de email válida" }
  
  has_many :grades, :dependent => :destroy
  
  def evaluated_percentage
    grades.includes(:activities).map(&:activity).inject(0) { |sum, activity| sum + activity.percentage }
  end
  
  def first_name
    name.split.first
  end
end
