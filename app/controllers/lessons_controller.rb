class LessonsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]

  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find_by!(url: params[:url])
    if @lesson.url.match?("vimmer")
      render @lesson.url.gsub('-', '_')
      return
    end
    @commands = @lesson.commands.sample(3)
    gon.commands = @commands
    logged_in? ? gon.user_login_flag = true : gon.user_login_flag = false
  end

  def vimmer_01
  end
end
