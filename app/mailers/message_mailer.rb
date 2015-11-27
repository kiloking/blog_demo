class MessageMailer < ApplicationMailer

	default from: "kilokingw@gmail.com"
  	default to: "threemouth@threemouth.com"

  def new_message(message)
    @message = message
    
    mail subject: "有來自成家居的訊息 #{message.name}"
  end
end
