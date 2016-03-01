class Mailer < ApplicationMailer

  def send_mail(user)  
    # @url  = 'http://example.com/login'  
    @code = user.security_code.code

    mail( :subject => 'Pinsole密码寻回',   
          :to => user.username,  
          :date => Time.now  
        )   
  end   

end