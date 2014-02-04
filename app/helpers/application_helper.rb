module ApplicationHelper
  def display_datetime(dt)
    if logged_in? and !current_user.time_zone.blank?
      dt = dt.in_time_zone(current_user.time_zone)
    end
    dt.strftime("%m/%d/%Y %l:%M%P %Z")
  end
  def fix_url(str)
    str.starts_with?('http://') ? str : "http://#{str}"
  end
end
