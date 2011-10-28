module ActivitiesHelper
  def percentage_sum
    sum = Activity.sum(:percentage)
    content_tag(:span, "#{sum}%", :class => (sum == 100 ? "green" : "red"))
  end
end
