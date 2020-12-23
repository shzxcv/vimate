class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top terms privacy help]

  def top; end

  def terms; end

  def privacy; end

  def help; end
end
