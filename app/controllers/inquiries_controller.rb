class InquiriesController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      InquiryMailer.inquiry_mail(@inquiry).deliver_later if @inquiry.email.present?
      redirect_to root_path, success: t('.success')
    else
      render 'new'
    end
  end

  def inquiry_params
    params.require(:inquiry).permit(:category, :name, :email, :body)
  end
end
