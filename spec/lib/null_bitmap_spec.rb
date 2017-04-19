require 'null_bitmap'

RSpec.describe NullBitmap do
  subject(:bitmap) { described_class.new }

  specify { expect { bitmap.clear }.to raise_error(/not supported/) }
  specify { expect { bitmap.pixel(1, 1, 'C') }.to raise_error(/not supported/) }
  specify { expect { bitmap.vertical_line(1, 1, 2, 'C') }.to raise_error(/not supported/) }
  specify { expect { bitmap.horizontal_line(1, 2, 1, 'C') }.to raise_error(/not supported/) }
  specify { expect(bitmap.render).to eq('There is no image') }
end
