require 'spec_helper'
require 'micro_blogger'

describe MicroBlogger do

  it "should have a client" do
    blogger = MicroBlogger.new
    expect(blogger).to respond_to :client
    expect(blogger.client).to be_kind_of Twitter::Client
  end

  let(:fake_client) do
    stub('OC Tanner Twitter Fake Client')
  end

  let(:blogger) do
    blogger = MicroBlogger.new
    blogger.stub(:client).and_return(fake_client)
    blogger
  end

  describe "#rank_friends" do
    it "should return a list of ranked friends with their scores" do

      blogger.stub(:followers).and_return([ "michelleobama", "octanner", "j3" ])
      blogger.stub(:klout_score_for_follower).with("michelleobama").and_return(83)
      blogger.stub(:klout_score_for_follower).with("j3").and_return(82)
      blogger.stub(:klout_score_for_follower).with("octanner").and_return(93)
      result = blogger.rank_friends
      expect(result).to eq [ "octanner", "michelleobama", "j3" ]

    end
    
    
  end
  
  describe "#tweet" do
    it "should send a tweet with my message" do
      message = "MicroBlogger Rocks!"
      fake_client.should_receive(:update).with(message)
      blogger.tweet(message)
    end

    context "when the tweet contains a url" do
      it "should shorten the url in the message" do
        bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
        full_url = "http://jumpstartlab.com/courses/"
        shortened_url = bitly.shorten(full_url).short_url

        message = "Check out #{full_url}"
        expected_message = "Check out #{shortened_url}"
        fake_client.should_receive(:update).with(expected_message)
        blogger.tweet(message)
      end
    end

    context "when the tweet is less 140 characters" do
      it "should send an update" do
        message = "MicroBlogger Rocks!"
        fake_client.should_receive(:update).with(message)
        blogger.tweet(message)
      end
    end

    context "when the tweet is greater 140 characters" do
      it "should not send an update" do
        too_long_message = "MicroBlogger Rocks!".ljust(141,"*")
        fake_client.should_not_receive(:update).with(too_long_message)
        blogger.tweet(too_long_message)
      end

    end
  end

  describe "#dm" do
    it "should send a direct mesasge" do
      fake_client.should_receive(:update).with("d username message")
      blogger.dm("username","message")
    end
  end

  describe "#process_command" do

    describe "tweet" do
      context "when given the command 'tweet MicroBlogger rocks!'" do
        it "should send an update" do
          blogger.should_receive(:tweet).with('MicroBlogger rocks')
          blogger.process_command('tweet MicroBlogger rocks')
        end
      end

    end

    context "when given the command 'exit I really want to quit'" do
      it "should not send an update" do
        blogger.should_not_receive(:tweet)
        blogger.process_command('exit I really want to quit')
      end
    end

    describe "dm" do
      context "when given the command 'dm j3 Happy Belated Birthday'" do
        it "should send a dm to j3 with the message 'Happy Belated Birthday'" do

          blogger.should_receive(:dm).with("j3","Happy Belated Birthday")
          blogger.process_command 'dm j3 Happy Belated Birthday'

        end
      end

    end

  end

end