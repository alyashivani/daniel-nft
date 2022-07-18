module BxBlockAdminconsole
  class ContactUsMailer < ApplicationMailer
  	default from: ENV['MAIL_FROM']
    def contact_us_email
      @contact = params[:contact_us]   
      mail( to: 'support@degee.io', subject: 'Degee.io Support Email') do |format| format.html { render 'contact_us_email' }
      end
    end     
  end
end