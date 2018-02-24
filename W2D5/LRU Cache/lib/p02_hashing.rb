class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    num = 0
    self.each_with_index do |el, idx|
      num += (el.hash + idx).hash
    end
    (num + length).hash
  end
end

class String
  def hash
    self.chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sorted = self.sort_by { |k, _| k }
    sorted.flatten.hash
  end
end
