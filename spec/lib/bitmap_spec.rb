require 'bitmap'

RSpec.describe Bitmap do
  let(:columns) { 3 }
  let(:rows) { 2 }

  describe '.new' do
    subject do
      -> { described_class.new(columns, rows) }
    end

    context 'with non-numeric columns' do
      let(:columns) { 'c' }

      it { is_expected.to raise_error(ArgumentError) }
    end

    context 'with non-positive columns' do
      let(:columns) { -1 }

      it { is_expected.to raise_error(ArgumentError) }
    end

    context 'with non-numeric rows' do
      let(:rows) { 'r' }

      it { is_expected.to raise_error(ArgumentError) }
    end

    context 'with non-positive rows' do
      let(:rows) { -1 }

      it { is_expected.to raise_error(ArgumentError) }
    end

    context 'with valid arguments' do
      it { is_expected.to_not raise_error }
    end
  end

  describe '#render' do
    let(:bitmap) { described_class.new(columns, rows) }
    let(:output) do
      <<~ENO
        OOO
        OOO
      ENO
    end

    subject { bitmap.render }

    it { is_expected.to eq(output.chomp) }
  end
end
