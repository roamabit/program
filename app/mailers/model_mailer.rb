class ModelMailer < ApplicationMailer
  default from: "Eliza@mg.eightkm.com"

def new_record_notification(recepient, record, note, url)
  @greeting = "Hi,"
  @record = record
  @recepient = recepient
  @mailer_note = note
  @url = url
  mail to: @recepient, subject: "Success! You did it."
end
end
