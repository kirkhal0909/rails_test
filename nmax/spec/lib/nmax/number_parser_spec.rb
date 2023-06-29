require 'spec_helper'

describe Nmax::NumberParser do
  before do
    allow($stdin).to receive(:eof).and_return(*([false] * input_blocks.length + [true]))
    allow($stdin).to receive(:read).and_return(*input_blocks)
  end

  subject(:service) { described_class.new(max_return) }
  let(:max_return) { 10 }

  describe '#call' do
    context 'one number in some blocks' do
      let(:input_blocks) { %w[1 2 3 s 3 2 aa 551 q 5] }

      it { expect(service.call).to eq([5, 32, 123, 551]) }
    end

    context 'numbers.count > max_return' do
      let(:max_return) { 3 }

      context 'last number less all' do
        let(:input_blocks) { %w[115 qwe 335 aaa 130 qwe 114] }

        it { expect(service.call).to eq([115, 130, 335]) }
      end

      context 'last number == numbers[0]' do
        let(:input_blocks) { %w[115 qwe 335 aaa 130 qwe 115] }

        it { expect(service.call).to eq([115, 130, 335]) }
      end

      context 'last number == numbers[0] + 1' do
        let(:input_blocks) { %w[115 qwe 335 aaa 130 qwe 116] }

        it { expect(service.call).to eq([116, 130, 335]) }
      end

      context 'last number == numbers[1] + 1' do
        let(:input_blocks) { %w[115 qwe 335 aaa 130 qwe 131] }

        it { expect(service.call).to eq([130, 131, 335]) }
      end

      context 'last number == numbers[-1]' do
        let(:input_blocks) { %w[115 qwe 335 aaa 130 qwe 335] }

        it { expect(service.call).to eq([130, 335, 335]) }
      end

      context 'last number == numbers[-1] + 1' do
        let(:input_blocks) { %w[115 qwe 335 aaa 130 qwe 336] }

        it { expect(service.call).to eq([130, 335, 336]) }
      end
    end

    context 'numbers.count == max_return' do
      let(:max_return) { 3 }
      let(:input_blocks) { %w[115 qwe 335 aaa 130] }

      it { expect(service.call).to eq([115, 130, 335]) }
    end

    context 'numbers.count < max_return' do
      let(:max_return) { 3 }
      let(:input_blocks) { %w[qet 123 qet 556] }

      it { expect(service.call).to eq([123, 556]) }
    end

    context 'max_return == 0' do
      let(:max_return) { 0 }
      let(:input_blocks) { %w[qet qet 1] }

      it { expect(service.call).to eq([]) }
    end
  end
end
