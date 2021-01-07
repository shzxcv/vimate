class CommandsController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index
    @lesson = Lesson.find_by!(url: params[:lesson_url])
    @commands = @lesson.commands
  end
end
