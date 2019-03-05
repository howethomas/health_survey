#!/usr/bin/env ruby
#
#

require "./lib/greenbot.rb"
will_take_survey = confirm "This is an automated message from St. Michael's Hospital. Would you like to answer a few quick questions about today's visit?"
will_take_survey.remember "will_take_survey"
unless will_take_survey
  tell 'Thank you - have a great day!'
  exit
end

experience_excellent = confirm "Was your visit to St. Michael's Hospital Excellent?"
experience_excellent.remember "experience_excellent"
if experience_excellent
  why_good = note "We're glad to hear that. What was the best part of your visit?"
  why_good.remember "why_good"
  anything_else = note "Thank you. Please tell us anything else you'd like us to know about your visit."
  anything_else.remember "anything_else"
  tell "Thank you. If you wish to speak with someone from St. Michael's Hospital, you can contact patient relations at 416-xxx-yyyy"
  exit
end

choices = %w(provider staff waittime cleanliness safety other)
why_not_excellent = select "Please tell us what we can do better", choices
case why_not_excellent
when 'provider'
  choices = %w(communication didntlisten unprofessional other)
  provider_reason = select "What about the health care professional?", choices
  provider_reason.remember "provider_reason"
  anything_else = note "Thank you. Please tell us anything else you would like us to know about your concern."
  anything_else.remember "anything_else"
when 'staff'
  choices = %w(communication didntlisten unprofessional other)
  staff_reason = select "What about the staff?", choices
  staff_reason.remember "staff_reason"
  anything_else = note "Thank you. Please tell us anything else you would like us to know about your concern."
  anything_else.remember "anything_else"
when 'waittime'
  choices = %w(phone clinic appointment)
  wait_reason = select "What about the wait time?", choices
  wait_reason.remember "wait_reason"
  anything_else = note "Thank you. Please tell us anything else you would like us to know about your concern."
  anything_else.remember "anything_else"
when 'cleanliness'
  choices = %w(washroom waiting exam other)
  what_needs_cleaning = select "What needs cleaning?", choices
  what_needs_cleaning.remember "what_needs_cleaning"
  anything_else = note "Thank you. Please tell us anything else you would like us to know about your concern."
  anything_else.remember "anything_else"
when 'safety'
  choices = %w(clinic building)
  where_do_feel_unsafe = select "Where did you feel unsafe?", choices
  where_do_feel_unsafe.remember "where_do_feel_unsafe"
  what_made_you_feel_unsafe = note "What made you feel unsafe?"
  what_made_you_feel_unsafe.remember "what_made_you_feel_unsafe"
  anything_else = note "Thank you. Please tell us anything else you would like us to know about your concern."
  anything_else.remember "anything_else"
when 'other'
  anything_else = note "Thank you. Please tell us anything else you would like us to know about your concern."
  anything_else.remember "anything_else"
end
tell "Thank you. If you wish to speak with someone from St. Michael's Hospital, you can contact patient relations at 416-xxx-yyyy"
