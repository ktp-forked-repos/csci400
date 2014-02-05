require_relative "EmailLogParser"

log = EmailLogParser.new 'mail.log'
log.mails.each do |mail|
  puts "ID: " + mail[0] + ", " +
       "Date/time: " + mail[1][:date].to_s + ", " +
       "Size: " + mail[1][:size].to_s + ", " +
       "From: " + mail[1][:from].to_s + ", " +
       "To: " + mail[1][:to].to_s
end
puts "Total messages: " + log.length.to_s
