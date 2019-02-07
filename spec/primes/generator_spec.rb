RSpec.describe Primes::Generator do
  describe '.run' do
    it 'returns the first 10 primes' do
      expect(described_class.run(10)).to eq(
        [
          2, 3, 5, 7, 11,
          13, 17, 19, 23, 29
        ]
      )
    end

    it 'returns the first 20 primes' do
      expect(described_class.run(20)).to eq(
        [
          2, 3, 5, 7, 11, 13,
          17, 19, 23, 29, 31,
          37, 41, 43, 47, 53,
          59, 61, 67, 71
        ]
      )
    end

    it 'returns no primes' do
      expect(described_class.run(-20)).to eq([])
    end
  end

  describe '#prime?' do
    subject { described_class.new(10).prime?(number) }

    context 'with a prime number' do
      let(:number) { 2 }

      it 'returns true' do
        expect(subject).to eq(true)
      end
    end

    context 'with a non prime number' do
      let(:number) { 10 }

      it 'returns false' do
        expect(subject).to eq(false)
      end
    end
  end
end
