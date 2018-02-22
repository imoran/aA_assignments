require 'towers'
require 'rspec'

RSpec.describe TowersOfHanoi do
  describe TowersOfHanoi do
    subject(:towers) { TowersOfHanoi.new }

    describe "#initialize" do
      it 'creates the towers instance variable to towers' do
        expect(towers.tower).to eq([[3, 2, 1], [ ], [ ]])
      end
    end

    describe "#move" do
      it 'moves a disk to another tower' do
        towers.move(0, 1)
        expect(towers.tower).to eq([[3, 2], [1], [ ]])
      end
    end

    describe "#valid_move?" do
      it 'prevents use from moving disk out of bounds' do
        expect(towers.valid_move?(0, 4)).to be_falsey
      end

      it 'prevents moving a bigger disk onto a smaller one' do
        towers.move(0, 1)
        expect(towers.valid_move?(0, 1)).to be_falsey
      end

    end

  end


end
