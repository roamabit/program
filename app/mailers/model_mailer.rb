class ModelMailer < ActionMailer::Base
  default from: "Eliza@mg.eightkm.com"

def new_record_notification(recepient, record)
  @greeting = "Hi,"
  @record = record
  @recepient = recepient
  mail to: @recepient, subject: "Success! You did it."
end
end
