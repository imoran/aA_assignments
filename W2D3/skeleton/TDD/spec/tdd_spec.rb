require 'tdd'
require 'rspec'

RSpec.describe do
  describe "#my_uniq" do
    let(:arr) { [1, 2, 1, 3, 3] }

    it 'removes duplicates' do
      expect(my_uniq(arr)).to eq([1, 2, 3])
    end
    it 'does not mutate original array' do
      expect(arr).to_not be(my_uniq(arr))
    end
  end

  describe "#two_sum" do
    context "when there are no 0 sum pairs" do
      let(:arr) { [-5, 0, 2, -3, 1] }
      it 'returns an empty array if no pairs are found' do
        expect(two_sum(arr)).to eq([])
      end

      it 'only pairs unique elements' do
        expect(two_sum(arr)).to eq([])
      end

    end

    context "when there are 0 sum pairs" do
      let(:arr) { [-1, 0, 2, -2, 1] }
      it "returns the pairs' indices" do
        expect(two_sum(arr)).to_not eq([[-1, 1], [2, -2]])
      end

      it "returns sorted pairs" do
        expect(two_sum(arr)).to eq([[0, 4], [2, 3]])
      end
    end
  end

  describe "#my_transpose" do
    let(:matrix) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }

    it 'returns a transposed matrix' do
      expect(my_transpose(matrix)).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end

    it 'new matrix only contains original elements' do
      expect(my_transpose(matrix).flatten.sort).to eq(matrix.flatten.sort)
    end
  end

  describe "#stock_picker" do
    let(:prices) { [1, 10, 25, 55, 100] }
    
    it 'returns the most profitable pair of days to buy/sell' do
      expect(stock_picker(prices)).to eq([0, 4])
    end

    context "when the biggest buy/sell days aren't the biggest difference" do
      let(:prices) { [36, 100, 1, 55, 30] }
      it 'does not return a lower second-day price' do
        expect(stock_picker(prices)).to_not eq([1, 2])
      end
    end
  end

end
