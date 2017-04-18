require 'bitmap_editor'

RSpec.describe BitmapEditor do
  let(:root) { File.join(File.dirname(__FILE__), '..', '..') }

  describe '#run' do
    let(:input) { '/path/to/input' }

    def run_editor
      described_class.new.run(input)
    end

    context 'with example that just calls "show"' do
      let(:input) { File.join(root, 'examples', 'show.txt') }
      let(:bitmap) { "There is no image\n" }

      specify { expect { run_editor }.to output(bitmap).to_stdout }
    end
  end
end
