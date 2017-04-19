require 'bitmap'

RSpec.describe Bitmap do
  let(:columns) { 3 }
  let(:rows) { 2 }
  let(:colour) { 'C' }
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

  describe '#vertical_line' do
    let(:column) { 3 }
    let(:start_row) { 2 }
    let(:end_row) { 2 }
    let(:output) do
      <<~ENO
        OOO
        OOC
      ENO
    end

    def draw_line
      bitmap.vertical_line(column, start_row, end_row, colour)
    end

    context 'with an out-of-bounds column' do
      let(:column) { 4 }

      specify { expect { draw_line }.to raise_error(ArgumentError) }
    end

    context 'with an out-of-bounds start row' do
      let(:start_row) { 3 }

      specify { expect { draw_line }.to raise_error(ArgumentError) }
    end

    context 'with an out-of-bounds end row' do
      let(:start_row) { 3 }

      specify { expect { draw_line }.to raise_error(ArgumentError) }
    end

    context 'with an end row before the start row' do
      let(:end_row) { 1 }
      let(:start_row) { 2 }

      specify { expect { draw_line }.to raise_error(ArgumentError) }
    end

    context 'with valid arguments' do
      before do
        draw_line
      end

      subject { bitmap.render }

      it { is_expected.to eq(output.chomp) }
    end
  end

  describe '#horizontal_line' do
    let(:row) { 2 }
    let(:start_column) { 2 }
    let(:end_column) { 3 }
    let(:output) do
      <<~ENO
        OOO
        OCC
      ENO
    end

    def draw_line
      bitmap.horizontal_line(start_column, end_column, row, colour)
    end

    context 'with an out-of-bounds row' do
      let(:row) { 3 }

      specify { expect { draw_line }.to raise_error(ArgumentError) }
    end

    context 'with an out-of-bounds start column' do
      let(:start_column) { 4 }

      specify { expect { draw_line }.to raise_error(ArgumentError) }
    end

    context 'with an out-of-bounds end column' do
      let(:start_column) { 4 }

      specify { expect { draw_line }.to raise_error(ArgumentError) }
    end

    context 'with an end context before the start column' do
      let(:end_column) { 1 }
      let(:start_column) { 2 }

      specify { expect { draw_line }.to raise_error(ArgumentError) }
    end

    context 'with valid arguments' do
      before do
        draw_line
      end

      subject { bitmap.render }

      it { is_expected.to eq(output.chomp) }
    end
  end
end
