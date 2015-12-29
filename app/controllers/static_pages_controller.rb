class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def terms
  end

  def privacy
  end

  def month_calendar
    @events = Event.where(:user_id => current_user.id)

  end

  def week_calendar
  end

end
