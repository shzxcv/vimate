module StaticPageHelper
  def title_size
    request.from_pc? ? 'is-size-2' : 'is-size-4'
  end

  def sub_title_size
    'is-size-4' if !request.from_pc?
  end

  def lesson_button
    request.from_pc? ? 'mt-4' : 'is-small mt-3'
  end

  def submit_button
    request.from_pc? ? 'w-50' : 'w-75'
  end

  def tablet_button
    'is-small' if request.from_android_tablet? || request.from_ipad?
  end
end
