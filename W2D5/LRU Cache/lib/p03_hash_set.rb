require_relative 'p02_hashing'

class HashSet
  attr_reader :store
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless self.include?(key)
      self[key.hash] << { key.hash => key }
      self.count += 1
      resize! if self.count > num_buckets
    end
  end

  def include?(key)
    self[key.hash].select{ |el| el.has_key?(key.hash) }.length == 1
  end

  def remove(key)
    self[key.hash].reject! { |el| el.has_key?(key.hash) }
  end

  private
  attr_writer :store
  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    self.store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_hash = self.store
    self.store = Array.new(num_buckets * 2) { Array.new }
    self.count = 0
    old_hash.each do |bucket|
      bucket.each do |hash|
        self.insert(hash.values[0])
      end
    end
  end
end

# [
#  << { our_thing.hash => our_thing }
# ]
#
# [] [] []


# self[hash]
# self.store[ hash % store.length ].select { |el| el.key == hash }
