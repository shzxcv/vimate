module LessonHelper
  def bg_image(lesson)
    if lesson.url == 'vim-01'
      "background-image: url(#{asset_pack_path 'media/images/stage/stage01.png'});"
    elsif lesson.url == 'vim-02'
      "background-image: url(#{asset_pack_path 'media/images/stage/stage02.png'});"
    elsif lesson.url == 'vim-03'
      "background-image: url(#{asset_pack_path 'media/images/stage/stage03.png'});"
    end
  end

  def progress_bg_color(lesson)
    if lesson.url == 'vim-01'
      "background-color: #80c896;"
    elsif lesson.url == 'vim-02'
      "background-color: #989898;"
    elsif lesson.url == 'vim-03'
      "background-color: #141651"
    end
  end

  def only_pc?
    if request.from_iphone? || request.from_ipad? || request.from_ipod? || request.from_android? || request.from_android_tablet? || request.from_windows_phone? || request.from_ios? || request.from_android_os?
      return false
    else
      return true
    end
  end
end
