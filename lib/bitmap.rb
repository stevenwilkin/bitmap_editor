class Bitmap
  def initialize(columns, rows)
    raise ArgumentError unless columns.to_i > 0
    raise ArgumentError unless rows.to_i > 0

    @columns = columns.to_i
    @rows = rows.to_i
    @pixels = Array.new(@rows) { Array.new(@columns, 'O') }
  end

  def render
    @pixels.reduce('') { |result, row| result.concat(row.join, "\n") }.chomp
  end
end
