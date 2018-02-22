def my_uniq(arr)
  result = []

  arr.each do |el|
    result << el unless result.include?(el)
  end
  result
end


def two_sum(arr)
  result = []
  (0...arr.length).each do |i|
    (i + 1...arr.length).each do |j|
      if arr[i] + arr[j] == 0
        result << [i, j]
      end
    end
  end
  result
end

def my_transpose(matrix)
  transposed = []
  nest = []
  i = 0
  while i < matrix.length
    matrix.each do |row|
      nest << row[i]
    end
    i += 1
    transposed << nest
    nest = []
  end

  transposed
end

def stock_picker(prices)

  combos = (0...prices.length).to_a.combination(2).to_a
  good_combos = combos.select { |combo| prices[combo[1]] > prices[combo[0]] }
  good_combos.sort_by { |combo| prices[combo[1]] - prices[combo[0]] }.last

end
