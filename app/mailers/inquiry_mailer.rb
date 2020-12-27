class InquiryMailer < ApplicationMailer

  def inquiry_mail(inquiry)
    @inquiry = inquiry
    mail(to: @inquiry.email, subject: 'お問い合わせ内容確認')
  end
end
