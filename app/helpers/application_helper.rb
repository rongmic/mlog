module ApplicationHelper
  def date_format time
    time.strftime("%B, %d, %Y")
  end
end
