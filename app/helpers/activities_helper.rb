module ActivitiesHelper
  def format_percentage(p)
    content_tag(:span, "#{p}%", :class => (p == 100 ? "green" : "red"))
  end
  
  def percentage_sum
    format_percentage(Activity.sum(:percentage))
  end
end
