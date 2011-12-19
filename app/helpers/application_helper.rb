module ApplicationHelper
  def pretty_date(date)
    date.to_time.strftime('%D')
  end
end
