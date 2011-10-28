class GradesController < ApplicationController
  def edit
    @grade = Grade.where(:activity_id => params[:id], :student_id => params[:student_id]).first
    @grade ||= Grade.new(:activity_id => params[:id], :student_id => params[:student_id])
  end
  
  def show
    @grade = Grade.where(:activity_id => params[:id], :student_id => params[:student_id]).first
    @grade ||= Grade.new(:activity_id => params[:id], :student_id => params[:student_id])    
  end
  
  def update
    @grade = Grade.where(:activity_id => params[:id], :student_id => params[:student_id]).first
    @grade ||= Grade.new(:activity_id => params[:id], :student_id => params[:student_id])
    @grade.grade = params[:grade][:grade]
    if @grade.save
      render "show"
    else
      render
    end
  end
end
