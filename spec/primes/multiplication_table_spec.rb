RSpec.describe Primes::MultiplicationTable do
  subject { described_class.new(count) }

  describe '.new' do
    context 'with a count of 10' do
      let(:count) { 10 }

      it 'has valid x axis primes' do
        expect(subject.x_axis).to eq(
          [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
        )
      end

      it 'has valid y axis primes' do
        expect(subject.y_axis).to eq(
          [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
        )
      end

      it 'has the correct count' do
        expect(subject.count).to eq(10)
      end
    end

    context 'with a count of 0' do
      let(:count) { 0 }

      it 'has no primes' do
        expect(subject.x_axis).to be_empty
        expect(subject.y_axis).to be_empty
      end
    end

    context 'with a count of -5' do
      let(:count) { -5 }

      it 'is empty' do
        expect(subject.x_axis).to be_empty
        expect(subject.y_axis).to be_empty
      end
    end
  end

  describe '#multiplication_table' do
    context 'with a count of 10' do
      let(:count) { 10 }

      it 'has the correct table values' do
        expect(subject.multiplication_table).to eq(
          [
            [4, 6, 10, 14, 22, 26, 34, 38, 46, 58],
            [6, 9, 15, 21, 33, 39, 51, 57, 69, 87],
            [10, 15, 25, 35, 55, 65, 85, 95, 115, 145],
            [14, 21, 35, 49, 77, 91, 119, 133, 161, 203],
            [22, 33, 55, 77, 121, 143, 187, 209, 253, 319],
            [26, 39, 65, 91, 143, 169, 221, 247, 299, 377],
            [34, 51, 85, 119, 187, 221, 289, 323, 391, 493],
            [38, 57, 95, 133, 209, 247, 323, 361, 437, 551],
            [46, 69, 115, 161, 253, 299, 391, 437, 529, 667],
            [58, 87, 145, 203, 319, 377, 493, 551, 667, 841]
          ]
        )
      end
    end

    context 'with a count of 0' do
      let(:count) { -5 }

      it 'is empty' do
        expect(subject.multiplication_table).to be_empty
      end
    end
  end

  describe '#generate' do
    context 'with a count of 2' do
      let(:count) { 2 }

      it 'is empty' do
        expect(subject.generate).to eq(
          [
            '   | 2 3',
            '---+-----',
            " 2 | 4 6\n 3 | 6 9\n"
          ]
        )
      end
    end

    context 'with a count of 0' do
      let(:count) { 0 }

      it 'is empty' do
        expect(subject.generate).to eq(
          [
            '  |',
            '--+-',
            ''
          ]
        )
      end
    end
  end
end
