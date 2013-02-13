require 'jumpstart_auth'
require 'bitly'
Bitly.use_api_version_3

class TweetAction

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

  def process_command(command)
    extracted_command, message = command.split(" ",2)
    action_for_command(extracted_command).execute(self,message)
  end

  def dm(username,message)
    client.update("d #{username} #{message}") if valid_tweet_message_length?(message.length)
  end

  def tweet(message)
    client.update(message) if valid_tweet_message_length?(message.length)
  end

  def actions
    @actions ||= [ TweetAction.new, DirectMessageAction.new ]
  end

  private

  def action_for_command(command)
    actions.find {|action| action.apply?(command)} || NoAction.new
  end

  def valid_tweet_message_length?(length)
    length < 140
  end

end