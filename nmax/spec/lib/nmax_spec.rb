require 'spec_helper'

describe Nmax do
  describe '.cli' do
    before do
      allow(ARGV).to receive(:[]).with(0).and_return(max_return)
      allow_any_instance_of(Nmax::NumberParser).to receive(:call).and_return(true)
    end
    context 'not valid arguments' do
      context 'arg is string' do
        let(:max_return) { 'some_not_valid_arg' }
        it 'return system exit' do
          expect { Nmax.cli }.to raise_error(SystemExit)
        end
      end

      context 'arg is skipped' do
        let(:max_return) { nil }
        it 'return system exit' do
          expect { Nmax.cli }.to raise_error(SystemExit)
        end
      end
    end

    context 'valid argument' do
      let(:max_return) { 10 }

      it 'return result' do
        expect(Nmax.cli).to eq(true)
      end
    end
  end
end
