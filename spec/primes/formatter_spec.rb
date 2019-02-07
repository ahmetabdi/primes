RSpec.describe Primes::Formatter do
  let(:x_axis) { [2, 4, 6, 8] }
  let(:y_axis) { [2, 4, 6, 8] }
  let(:multiplication_table) { [[2, 4, 6, 8]] }

  subject { described_class.new(x_axis, y_axis, multiplication_table) }

  describe '.run' do
    it 'returns the correct format' do
      expect(described_class.run(x_axis, y_axis, multiplication_table)).to eq(
        [
          '   | 2 4 6 8',
          '---+---------',
          " 2 | 2 4 6 8\n"
        ]
      )
    end
  end

  describe '#header_output' do
    it 'returns output for the heaer' do
      expect(subject.header_output).to eq('   | 2 4 6 8')
    end
  end

  describe '#spacer_output' do
    it 'returns output for the spacer' do
      expect(subject.spacer_output).to eq('---+---------')
    end
  end

  describe '#table_output' do
    it 'returns output for the table' do
      expect(subject.table_output).to eq(" 2 | 2 4 6 8\n")
    end
  end

  describe '#table_padding' do
    it 'returns the numbers of digits the largest number in the table has' do
      expect(subject.table_padding).to eq(2)
    end
  end

  describe '#spacing' do
    context 'with a table padding of 4' do
      before do
        allow(subject).to receive(:table_padding).and_return(4)
      end

      it 'adds three spaces to a single digit' do
        expect(subject.spacing(2)).to eq('   2')
      end

      it 'adds two spaces to a double digit' do
        expect(subject.spacing(22)).to eq('  22')
      end
    end
  end

  describe '#row_output' do
    it 'adds spacing to a given number' do
      expect(subject.row_output([2, 4, 6, 8])).to eq(' 2 4 6 8')
    end
  end
end
