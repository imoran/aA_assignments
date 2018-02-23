require "byebug"

#O(n^2)
def my_min(list)
  min = nil
  list.each do |l1|
    min = l1
    list.each do |l2|
      next if l1 == l2
      min = l2 if l2 < min
    end
  end
  min
end

#O(n)
def my_min_2(list)
  min = list.first
  i = 1
  while i < list.length
    min = list[i] if list[i] < min
    i += 1
  end
  min
end


# n^2 => O(n^2)
def sub_sum(list)
  sub = []
  i = 0

  while i < list.length
    sub << list[i]
    j = i + 1
    while j < list.length
      sub << list[i..j].reduce(:+)
      j += 1
    end
    i += 1
  end
  sub.max
end

#O(n) time #O(1) space
def sub_sum_2(list)
  counter = 0
  max = list.first
  list.each_index do |idx|
    counter += list[idx]
    if counter >= max
      max = counter
    end
    if counter < 0
      counter = 0
    end
  end
  max
end
