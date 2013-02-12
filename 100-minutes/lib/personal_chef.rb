require 'date'

class PersonalChef
  def make_toast(style = default_toast_style)
    puts "Making your #{style} toast!"
    self
  end

  def make_milkshake
    puts "Make a milkshakes"
    self
  end

  def default_toast_style
    "sourdough"
  end

  def make_eggs(number)
    number.times { puts "Making Egg" }
    puts "I'm done"
    self
  end

end

class Butler
  def open_front_door
    puts "Opening Front Door, SIRRRRRR!"
  end

  def open_door(name)
    if white_listed_doors.include? name.to_s.downcase
      puts "Opening the #{name.capitalize} Door SIRRRRRR!"
    else
      puts "I won't go in there SIRRRRRR!"
    end
  end

  def white_listed_doors
    [ "front", "back" ]
  end
  
  def good_morning
    date = Date.today
    day_of_week = date.strftime "%A"
    day_of_year = date.strftime "%j"
    year = date.strftime "%Y"
    year = Time.now.year.to_s
    
    puts "Happy #{day_of_week}, it's the #{day_of_year} day of #{year}"
  end
end

frank = PersonalChef.new
frank.make_toast.make_milkshake

jeeves = Butler.new
jeeves.open_front_door
jeeves.good_morning
