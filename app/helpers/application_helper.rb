module ApplicationHelper

  def map_or_login_tiles_toggle
    if current_user
      concat(render(:partial => 'welcome/map'))
    else
      concat(render(:partial => 'welcome/login_tiles'))
    end
  end

end
