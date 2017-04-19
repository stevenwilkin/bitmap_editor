class Bitmap
  def initialize(columns, rows)
    raise ArgumentError unless columns.to_i > 0
    raise ArgumentError unless rows.to_i > 0
  end
end
