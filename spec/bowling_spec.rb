require_relative '../bowling'

def make_rolls(rolls)
  rolls.each { |roll| game.roll(roll) }
end

describe Bowling do
  let(:game) { described_class.new }

  context 'a single roll' do
    it 'returns 1 after rolling 1' do
      game.roll(1)
      expect(game.score).to eq(1)
    end

    it 'returns 2 after rolling 2' do
      game.roll(2)
      expect(game.score).to eq(2)
    end
  end

  context 'a single frame' do
    it 'returns 3 after rolling 1 and then 2' do
      make_rolls([1, 2])
      expect(game.score).to eq(3)
    end
  end

  context 'a frame with a spare' do
    it 'adds the value of the next roll to the total score' do
      make_rolls([5, 5, 5])
      expect(game.score).to eq(20)
    end

    it 'adds the value of the next roll to the total score' do
      make_rolls([4, 6, 7])
      expect(game.score).to eq(24)
    end
  end

  context 'a frame with a strike' do
    it 'adds the value of the next frame to the total score' do
      make_rolls([10, 1, 1])
      expect(game.score).to eq(14)
    end
  end

  context 'with two frames' do
    context 'with no special frames' do
      it 'returns the sum of the rolls' do
        make_rolls([4, 4, 4, 3])
        expect(game.score).to eq(15)
      end
    end
  end

  context 'with many frames' do
    context 'with a strike on the second frame' do
      context 'with nothing following' do
        it 'returns the current total of the ' do
          make_rolls([1, 1, 10])
          expect(game.score).to eq(12)
        end
      end

      it 'adds the value of the frame after the strike to the total score' do
        make_rolls([1, 1, 10, 1, 1])
        expect(game.score).to eq(16)
      end
    end

    context 'with a spare on the second frame' do
      it 'add value of roll after spare to the total score' do
        make_rolls([3, 4, 6, 4, 8, 1])
        expect(game.score).to eq(34)
      end

      it 'add value of roll after spare to the total score' do
        make_rolls([4, 4, 6, 4, 1, 1])
        expect(game.score).to eq(21)
      end
    end

    context 'with a spare on the third frame' do
      it 'adds the value of the roll after the spare to the total score' do
        make_rolls([1, 2, 3, 4, 5, 5, 6, 1])
        expect(game.score).to eq(33)
      end
    end
  end

end
