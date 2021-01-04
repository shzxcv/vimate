class UserLessonsController < ApplicationController
  def create
    return if !logged_in?
    @user_lesson = UserLesson.new(params_url_to_id)
    @user_lesson.save
  end

  private

  def user_lesson_params
    params.require(:user_lesson).permit(:time, :answer_rate, :lesson_id).merge(user_id: current_user.id)
  end

  def params_url_to_id
    attrs = user_lesson_params.to_h
    attrs[:lesson_id] = Lesson.find_by!(url: attrs[:lesson_id]).id
    attrs
  end
end
