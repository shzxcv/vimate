class LessonsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]

  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
    gon.lesson_count = 3
    gon.commands = @lesson.commands.sample(gon.lesson_count)
  end
end
