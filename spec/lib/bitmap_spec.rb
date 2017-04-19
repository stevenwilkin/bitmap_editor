require 'bitmap'

RSpec.describe Bitmap do
  let(:columns) { 3 }
  let(:rows) { 2 }
  let(:bitmap) { described_class.new(columns, rows) }

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
    let(:output) do
      <<~ENO
        OOO
        OOO
      ENO
    end

    subject { bitmap.render }

    it { is_expected.to eq(output.chomp) }
  end

  describe '#pixel' do
    let(:column) { 2 }
    let(:row) { 1 }
    let(:colour) { 'C' }

    def set_pixel
      bitmap.pixel(column, row, colour)
    end

    context 'with an out-of-bounds column' do
      let(:column) { 4 }

      specify { expect { set_pixel }.to raise_error(ArgumentError) }
    end

    context 'with an out-of-bounds row' do
      let(:row) { 3 }

      specify { expect { set_pixel }.to raise_error(ArgumentError) }
    end

    context 'with valid arguments' do
      let(:output) do
        <<~ENO
          OCO
          OOO
        ENO
      end

      before do
        set_pixel
      end

      subject { bitmap.render }

      it { is_expected.to eq(output.chomp) }
    end
  end

  describe '#clear' do
    let(:output) do
      <<~ENO
        OOO
        OOO
      ENO
    end

    before do
      bitmap.pixel(1, 1, 'C')
      bitmap.clear
    end

    subject { bitmap.render }

    it { is_expected.to eq(output.chomp) }
  end
end
