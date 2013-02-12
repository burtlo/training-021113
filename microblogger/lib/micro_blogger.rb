require 'jumpstart_auth'

class MicroBlogger

  def initialize
    puts "Initializing"
  end

  def client
    @client ||= JumpstartAuth.twitter
  end

  def process_command(command)
    execute, message = command.split(" ",2)
    tweet(message) if execute == "tweet"
  end

  def tweet(message)
    client.update(message) if valid_tweet_message_length?(message.length)
  end

  def valid_tweet_message_length?(length)
    length < 140
  end

end