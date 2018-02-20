# PHASE 2

class NumberInputError < ArgumentError #ArgumentError
  def initialize(msg = "Not provided a number")
    super(msg)
  end
end

def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError
    puts "GIVE ME NUMBERS, I'M NOT TRYING TO KNIT!"
  ensure
    num ||= nil
  end
  num
end


class FruitError < StandardError
  def message
    "Not a fruit"
  end
end

class CoffeeError < StandardError
  def initialize(msg = "OO I love coffee!!!")
    @msg = msg
    puts msg
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == 'coffee'
    raise CoffeeError
  else
    raise FruitError
  end
end

def feed_me_a_fruit
  begin
    puts "Hello, I am a friendly monster. :)"

    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue FruitError => e
    puts e.message
    nil
  rescue CoffeeError
    retry
  end
end


class FriendshipError < StandardError
  def message
    "REAL FRIENDS HAVE AT LEAST 5 YEARS!!"
  end
end

class NameError < StandardError
  def message
    "SCREEN NAMES DON'T COUNT"
  end
end

class HobbyError < StandardError
  def message
    "GET OUTSIDE AND WATCH GRASS GROW"
  end
end


# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    begin
      # raise ArgumentError.new("'name' cannot be blank") if name.empty?
      # raise ArgumentError.new("'yrs_known' must be greater than or equal to 5 (best friendships take time)") if yrs_known.to_i < 5
      # raise ArgumentError.new("'fav_pasttime' cannot be blank") if fav_pastime.empty?
      raise FriendshipError if yrs_known < 5
      raise NameError if name == ""
      raise HobbyError if fav_pastime == ""
      @name = name
      @yrs_known = yrs_known.to_i
      @fav_pastime = fav_pastime
    # rescue FriendshipError => e
    #   puts e.message
    # rescue NameError => e
    #   puts e.message
    # rescue HobbyError => e
    #   puts e.message
    end
  end


  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
