class NotificationMailer < ActionMailer::Base
  default from: "no-reply@nomster.com"

  def comment_added
    mail(to: "saroar9@gmail.com",
          subject: "A comment has beed added to your place")
  end
end
