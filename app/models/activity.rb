class Activity < ActiveRecord::Base
  validates :name, :presence => true
  validates :date, :presence => true
  validates :percentage, :presence => true, :numericality => { :greater_than => 0, :less_than_or_equal_to => 100, :only_integer => true }
  
  has_many :grades, :dependent => :destroy
  
  default_scope order("date ASC")
end
