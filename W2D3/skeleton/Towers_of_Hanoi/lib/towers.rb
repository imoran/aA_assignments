class TowersOfHanoi
  attr_reader :tower

  def initialize
    @tower = [[3, 2, 1],[ ],[ ]]
  end

  def move(from, to)
    tower[to] << tower[from].pop
  end

  def valid_move?(from, to)
    return false if [from, to].any? { |val| val.between?(0, 2) }
    return false if tower[from].last > tower[to].last


  end

end
