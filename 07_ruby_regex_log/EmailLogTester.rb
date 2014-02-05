require 'test/unit'
require_relative "EmailLogParser"

class EmailLogTester < Test::Unit::TestCase
  def setup
    log = EmailLogParser.new "mail.log"
    @mails = log.mails
  end

  def testMessageID
    assert(@mails['5026B1BA094'] != nil)
    assert(@mails['9E59D1BA094'] != nil)
    assert(@mails['A54F11B2003'] != nil)
    assert(@mails['C32F81B2003'] != nil)
    assert_equal(nil, @mails['bob'])
    assert_equal(nil, @mails['C32F81B2014'])
  end

  def testDateTime
    assert_equal("Dec 12 11:48:32", @mails['5026B1BA094'][:date])
    assert_equal("Dec 12 23:33:30", @mails['9E59D1BA094'][:date])
    assert_equal("Dec 11 05:14:03", @mails['A54F11B2003'][:date])
    assert_equal("Dec 12 03:13:40", @mails['C32F81B2003'][:date])
  end

  def testMessageSize
    assert_equal("2248", @mails['5026B1BA094'][:size])
    assert_equal("1569", @mails['9E59D1BA094'][:size])
    assert_equal("870", @mails['A54F11B2003'][:size])
    assert_equal("1543", @mails['C32F81B2003'][:size])
  end

  def testFromAddress
    assert_equal("www-data@toilers.Mines.EDU", @mails['5026B1BA094'][:from])
    assert_equal("www-data@toilers.Mines.EDU", @mails['9E59D1BA094'][:from])
    assert_equal("toilers@mines.edu", @mails['A54F11B2003'][:from])
    assert_equal("www-data@toilers.Mines.EDU", @mails['C32F81B2003'][:from])
  end

  def testToAddress
    assert_equal(["mickeymouse@mymail.mines.edu"], @mails['5026B1BA094'][:to])
    assert_equal(["winniepooh@mymail.mines.edu"], @mails['9E59D1BA094'][:to])
    assert_equal(["toilers@mines.edu"], @mails['A54F11B2003'][:to])
    assert_equal(["pat@code.org"], @mails['C32F81B2003'][:to])
    assert_equal(["echopper@mines.edu", "mheck@mines.edu", "frodobaggins@mines.edu"],
                 @mails['3D6B61B2004'][:to])
  end

  def testMessageCount
    assert_equal(61, @mails.length)
  end
end
