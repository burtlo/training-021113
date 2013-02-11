class Fixnum
  def dozen
    self * 12
  end
  
  def +(value)
    puts "Gotcha #{value}"
    0
  end
end

puts 1.dozen

puts 1 + 1