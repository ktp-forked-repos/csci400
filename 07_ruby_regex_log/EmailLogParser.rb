require_relative "EmailLogLine"

class EmailLogParser
  def initialize file
    @log = open(file).read.split /\n/
    @mails = {}
    parse
  end

  def parse
    @log.each do |line|
      # Get the date, message id, and data from the line.
      match = line.match /^([^ ]+ [^ ]+ [^ ]+) [^ ]+ [^ ]+ ([^ ]+): (.*)$/
      # match[1] is the date/time, match[2] is the ID, match[3] is the
      # rest of the information that we will continue parsing.
      @mails[match[2]] ||= {}
      @mails[match[2]].store :date, match[1]
      # Initialize 'to' to a list, so it can store multiple addresses.
      @mails[match[2]][:to] ||= []
      subparse match[2], match[3]
    end
  end

  def subparse id, data
    data.split(', ').each do |attr|
      # to
      match = attr.match /^to=<(.+)>$/
      if match != nil
        @mails[id][:to].push match[1]
      end

      # from
      match = attr.match /^from=<(.+)>$/
      if match != nil
        @mails[id].store :from, match[1]
      end

      # size
      match = attr.match /^size=(\d+)$/
      if match != nil
        @mails[id].store :size, match[1]
      end
    end
  end

  def mails
    @mails
  end

  def length
    @mails.length
  end
end
