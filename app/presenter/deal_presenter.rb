class DealPresenter < BasePresenter
  presents :deal

  def time_range
    return "" if deal.start_time.blank? || deal.end_time.blank?
    "#{deal.start_time.strftime('%-l:%M')} - #{deal.end_time.strftime('%-l:%M %p')}"
  end

  def timestamp
    "#{deal.start_time.strftime("%l:%M %p")} – #{deal.end_time.strftime("%l:%M %p")}"
  end

  def days_list
    if deal.everyday?
      "Everyday"
    elsif deal.weekend?
      "Weekends"
    elsif deal.weekday?
      "Weekdays"
    else
      deal.day.join(", ")
    end
  end
end
