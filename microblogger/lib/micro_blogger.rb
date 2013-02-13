require 'jumpstart_auth'

class TweetAction

  # "tweet"
  def apply?(criteria)
    criteria == "tweet"
  end

  def execute(blogger,message)
    blogger.tweet(message)
  end

end

class DirectMessageAction

  def apply?(criteria)
    criteria == "dm"
  end

  def execute(blogger,username_and_message)
    username, message = username_and_message.split(" ",2)
    blogger.dm(username,message)
  end

end

class NoAction
  def apply?(criteria)
    true
  end

  def execute(blogger,message) ; end
end

class MicroBlogger

  def initialize
    puts "Initializing"
  end

  def client
    @client ||= JumpstartAuth.twitter
  end

  def actions
    [ TweetAction.new, DirectMessageAction.new, NoAction.new ]
  end

  def process_command(command)
    execute, message = command.split(" ",2)

    current_action = actions.find {|action| action.apply?(execute)}
    current_action.execute(self,message)

  end

  def dm(username,message)
    client.update("d #{username} #{message}") if valid_tweet_message_length?(message.length)
  end

  def tweet(message)
    client.update(message) if valid_tweet_message_length?(message.length)
  end

  def valid_tweet_message_length?(length)
    length < 140
  end

end