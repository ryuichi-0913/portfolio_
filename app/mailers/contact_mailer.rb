class ContactMailer < ApplicationMailer
  default from: 'from@example.com'
  # メソッドに対して引数を設定
  def send_when_admin_reply(user, contact)
    @user = user # ユーザー情報
    @answer = contact.reply # 返信内容
    mail to: user.email, subject: '【TunaguKoe】 お問い合わせありがとうございます'
  end
end
