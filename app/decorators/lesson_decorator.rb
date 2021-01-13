class LessonDecorator < Draper::Decorator
  delegate_all

  def lesson_name
    "#{object.category_i18n}#{object.name}"
  end
end
