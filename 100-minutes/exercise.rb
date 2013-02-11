#
# https://github.com/styleguide/ruby
#

class ExperimentAtMoment

end

class Sample

  def hello
    greetings.each do |greeting|
      puts greeting
    end
  end

  def self.say(message)
    puts message.object_id
    puts "Sample: #{message}"
  end

  private

  def greetings
    [ "Hello World" ]
  end

end

s = Sample.new()
s.hello()
string = "Hello World"
puts string.object_id
Sample.say("Hello World")
# puts s.object_id
# Sample.say s