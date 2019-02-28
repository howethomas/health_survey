#!/usr/bin/env ruby
#
#

require "./lib/greenbot.rb"
choices = %w(poor fair good great excellent)
overallExp = select ENV['WELCOME'], choices
case overallExp
when 'poor'
  questions = %w(Q_1 Q_2 Q_3 Q_4 Q_5 Q_6 Q_7)
when 'fair'
  questions = %w(Q_1 Q_2 Q_3 Q_4 Q_5 Q_6 Q_7)
when 'good'
  questions = %w(Q_1 Q_2 Q_3 Q_4 Q_5 Q_7)
when 'great'
  questions= %w(Q_1 Q_2 Q_3 Q_4)
when 'excellent'
  questions= %w(Q_2 Q_3 Q_4)
end

for q in questions
  case q
  when 'Q_1', 'Q_2', 'Q_3', 'Q_4', 'Q_5'
    ans = select ENV[q], choices
    ans.remember(q)
  when 'Q_6', 'Q_7'
    ans = note(ENV[q]) 
    ans.remember(q)
  end
end

tell ENV['SIGNATURE']

