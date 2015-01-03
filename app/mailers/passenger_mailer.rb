class PassengerMailer < ActionMailer::Base
  default from: "from@example.com"

  def thank_you_email(passenger)
    @passenger = passenger
    @url  = 'http://example.com/login'
    email_with_name = "#{@passenger.name} <#{@passenger.email}>"
    mail(to: email_with_name, subject: 'Thank You For Booking Your Flight')
    #mail(to: @passenger.email, subject: 'Thank You For Booking Your Flight')
  end

end
