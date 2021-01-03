class LessonsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]

  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find_by!(url: params[:url])
    @commands = @lesson.commands.sample(3)
    gon.commands = @commands
  end
end
