#
# https://github.com/styleguide/ruby
#

class Experiment

end

class Sample

  def hello()
    greetings.each do |greeting|
      puts greeting
    end
  end

  def self.say(message)
    puts "Sample: #{message}"
  end

  private

  def greetings
    [ "Hello World" ]
  end

end

s = Sample.new()
s.hello()
Sample.say("Hello World!")
Sample.say 1
Sample.say s