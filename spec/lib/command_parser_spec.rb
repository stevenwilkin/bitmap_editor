require 'command_parser'

RSpec.describe CommandParser do
  describe '.parse' do
    let(:input) { '' }

    def parse_input
      described_class.parse(input)
    end

    context 'with an unrecognised command' do
      let(:input) { 'Z 1 1 C' }

      specify { expect { parse_input }.to raise_error(/unrecognised/) }
    end
  end
end
