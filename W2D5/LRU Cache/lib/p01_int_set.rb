class MaxIntSet
  attr_reader :max, :store

  def initialize(max)
    @max = max
    @store = Array.new(max) { false }
  end

  def insert(num)
    self.store[num] = true if is_valid?(num)
  end

  def remove(num)
    self.store[num] = false
  end

  def include?(num)
    self.store[num]
  end

  private

  def is_valid?(num)
    raise "Out of bounds" unless (0..self.max).cover?(num)
    true
  end
end


class IntSet

  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].reject! { |x| x == num }
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    self.store[num % num_buckets]
  end


  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless self[num].include?(num)
      self[num] << num
      self.count += 1
      resize! if self.count >= num_buckets
    end
  end

  def remove(num)
    if self[num].include?(num)
      self[num].reject! { |x| x == num }
      self.count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private
  attr_writer :count, :store

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    self.store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_set = self.store
    self.store = Array.new(num_buckets * 2) { Array.new }
    self.count = 0
    old_set.each do |bucket|
      bucket.each do |num|
        self.insert(num)
      end
    end
  end
end
