require 'command_parser'

RSpec.describe CommandParser do
  describe '.parse' do
    let(:input) { '' }
    let(:command) { command, *args = parse_input; command }
    let(:args) { command, *args = parse_input; args }

    def parse_input
      described_class.parse(input)
    end

    context 'with an unrecognised command' do
      let(:input) { 'Z 1 1 C' }

      specify { expect { parse_input }.to raise_error(/unrecognised/) }
    end

    context 'with the clear command' do
      let(:input) { 'C' }

      specify { expect(command).to eq(:clear) }
      specify { expect(args).to be_empty }
    end

    context 'with the show command' do
      let(:input) { 'S' }

      specify { expect(command).to eq(:render) }
      specify { expect(args).to be_empty }
    end

    context 'with the initialise command' do
      let(:input) { 'I 50 20' }

      specify { expect(command).to eq(:initialise) }
      specify { expect(args).to eq([50, 20]) }
    end

    context 'with the pixel command' do
      let(:input) { 'L 10 5 C' }

      specify { expect(command).to eq(:pixel) }
      specify { expect(args).to eq([10, 5, 'C']) }
    end

    context 'with the vertical line command' do
      let(:input) { 'V 10 5 10 C' }

      specify { expect(command).to eq(:vertical_line) }
      specify { expect(args).to eq([10, 5, 10, 'C']) }
    end

    context 'with the horizontal line command' do
      let(:input) { 'H 10 5 10 C' }

      specify { expect(command).to eq(:horizontal_line) }
      specify { expect(args).to eq([10, 5, 10, 'C']) }
    end
  end
end
