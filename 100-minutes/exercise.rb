#
# https://github.com/styleguide/ruby
# 

class Experiment
  
end

class Sample

  def hello()
    puts("Hello World");
  end
  
  def self.say(message)
    puts message
  end

end

e = Experiment.new()

s = Sample.new()
s.hello()
Sample.say "Hello World!"