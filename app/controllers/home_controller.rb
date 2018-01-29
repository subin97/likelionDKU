class HomeController < ApplicationController
  def index
  end
  def shoot
    @client = params[:mail_address] # params로 받아온 답장 받을 주소
    @title = params[:mail_title] # params로 받아온 메일 제목
    @content = params[:mail_content] # params로 받아온 메일 내용
    require 'mailgun'
    # First, instantiate the Mailgun Client with your API key
    mg_client = Mailgun::Client.new 'key-e79d2660843cf58b62b043e23aef1235'
    # Define your message parameters
    message_params = { from: @client, # 고객이 답장 받을 주소
                        to: 'dku@likelion.org', # 내가 메일 받을 주소
                        subject: @title, # 메일제목
                        text: @content # 메일내용
                       }
    result = mg_client.send_message('sandbox8f07cf2d53854984b3cbbadc2b3c56da.mailgun.org', message_params).to_h!
    message_id = result['id']
    message = result['message']
    redirect_to '/' 
  end
end
