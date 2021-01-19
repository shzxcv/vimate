module MypageHelper
  def user_level_icon(level)
    case level
      when :hiyokko then
        "fas fa-egg fa-fw fa-lg faa-bounce animated"
      when :nitouhei then
        "fas fa-check-double fa-fw fa-lg faa-bounce animated"
      when :ittouhei then
        "fas fa-check fa-fw fa-lg faa-bounce animated"
      when :joutouhei then
        "far fa-check-square fa-fw fa-lg faa-bounce animated"
      when :heityou then
        "fas fa-check-square fa-fw fa-lg faa-bounce animated"
      when :gotyou then
        "fas fa-clipboard-check fa-fw fa-lg faa-bounce animated"
      when :gunsou then
        "fas fa-calendar-check fa-fw fa-lg faa-bounce animated"
      when :soutyou then
        "fas fa-receipt fa-fw fa-lg faa-bounce animated"
      when :juni then
        "far fa-flag fa-fw fa-lg faa-bounce animated"
      when :syoui then
        "fas fa-flag fa-fw fa-lg faa-bounce animated"
      when :tyuui then
        "fas fa-flag-checkered fa-fw fa-lg faa-bounce animated"
      when :taii then
        "fas fa-flag-usa fa-fw fa-lg faa-bounce animated"
      when :syousa then
        "fas fa-chess-pawn fa-fw fa-lg faa-bounce animated"
      when :tyuusa then
        "fas fa-chess-rook fa-fw fa-lg faa-bounce animated"
      when :taisa then
        "fas fa-chess-knight fa-fw fa-lg faa-bounce animated"
      when :syousyou then
        "fas fa-chess fa-fw fa-lg faa-bounce animated"
      when :tyuusyou then
        "fas fa-chess-king fa-fw fa-lg faa-bounce animated"
      when :taisyou then
        "fas fa-chess-queen fa-fw fa-lg faa-bounce animated"
    end
  end

  def user_level_icon_color(level)
    case level
      when :hiyokko then
        "color: #FFDAB9"
      when :nitouhei then
        "color: #40E0D0"
      when :ittouhei then
        "color: #40E0D0"
      when :joutouhei then
        "color: #40E0D0"
      when :heityou then
        "color: #228B22"
      when :gotyou then
        "color:	#228B22"
      when :gunsou then
        "color:	#228B22"
      when :soutyou then
        "color:	#228B22"
      when :juni then
        "color: #708090"
      when :syoui then
        "color: #708090"
      when :tyuui then
        "color: #708090"
      when :taii then
        "color: #708090"
      when :syousa then
        "color: #DDA0DD"
      when :tyuusa then
        "color: #DDA0DD"
      when :taisa then
        "color: #DDA0DD"
      when :syousyou then
        "color: #DAA520"
      when :tyuusyou then
        "color: #DAA520"
      when :taisyou then
        "color: #DAA520"
    end
  end

  def chart_responsive
    request.from_pc? ? '700px' : '260px'
  end

  def button_size
    request.from_pc? ? 'w-50' : 'w-100'
  end
end
