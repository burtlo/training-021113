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

  describe "#tweet" do
    it "should send a tweet with my message" do
      message = "MicroBlogger Rocks!"
      fake_client.should_receive(:update).with(message)
      blogger.tweet(message)
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

  describe "#process_command" do
    context "when given the command 'tweet MicroBlogger rocks!'" do
      it "should send an update" do
        fake_client.should_receive(:update).with('MicroBlogger rocks')
        blogger.process_command('tweet MicroBlogger rocks')
      end
    end

    context "when given the command 'exit I really want to quit'" do
      it "should not send an update" do
        fake_client.should_not_receive(:update)
        blogger.process_command('exit I really want to quit')
      end
    end

  end

end