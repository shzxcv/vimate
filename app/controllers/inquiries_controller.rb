class InquiriesController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    redirect_to root_path
    # Memo: お問い合わせ機能は一旦停止 Bot対策のため
    # @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      InquiryMailer.inquiry_mail(@inquiry).deliver_later if @inquiry.email.present?
      slack_notifier(@inquiry) if Rails.env.production?
      redirect_to root_path, info: t('.info')
    else
      render 'new'
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:category, :name, :email, :body)
  end

  def slack_notifier(inquiry)
    notifier = Slack::Notifier.new Rails.application.credentials.slack[:inquiry_url]
    attachments = {
        author_name: inquiry.name,
        title: inquiry.category_i18n,
        text: "問い合わせ内容 : #{inquiry.body}\rメールアドレス : #{inquiry.email}",
    }
    notifier.post attachments: [attachments]
  end
end
