class MessagesController < ApplicationController

	def new
    	@message = Message.new
  end

	def create
	    @message = Message.new(message_params)
	    
	    if @message.valid?
	      MessageMailer.new_message(@message).deliver
	      redirect_to root_path, notice: "謝謝，您的訊息已經送出，將盡快回覆您。"
	    else
	      redirect_to root_path, notice: "訊息傳送失敗，請嘗試再填寫一次。"
	    end
	end

	private

	def message_params
	    params.require(:message).permit(:name, :email, :content)
	end
end
