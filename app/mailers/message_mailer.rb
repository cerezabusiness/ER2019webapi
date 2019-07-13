class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.consultation_mail.subject
  #
  def consultation_mail(name, email, consultation,destination)
    @username = name
    @consultation = consultation
    @email = email
    mail(to: destination, subject: "Tienes una nueva consulta en tu evento")
  end
end
