require 'jumpstart_auth'
require 'bitly'
Bitly.use_api_version_3
require 'klout'

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

  # @return [ "franklinwebber", "barackobama", "j3", "twitter" ]
  def followers
    client.followers.map {|follower| follower["screen_name"] }
  end

  def process_command(command)
    extracted_command, message = command.split(" ",2)
    action_for_command(extracted_command).execute(self,message)
  end

  def dm(username,message)
    client.update("d #{username} #{message}") if valid_tweet_message_length?(message.length)
  end

  def tweet(message)
    bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')

    # from the message I want to find a url in the message
    urls = message.split.collect do |word|
      word if word.start_with? "http"
    end

    urls.compact!

    urls.each do |url|
      shortened_url = bitly.shorten(url).short_url
      message.gsub!(url,shortened_url)
    end

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