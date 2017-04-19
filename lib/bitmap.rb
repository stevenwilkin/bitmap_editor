class Bitmap
  def initialize(columns, rows)
    @columns = columns
    @rows = rows
    clear
  end

  def render
    @pixels.reduce('') { |result, row| result.concat(row.join, "\n") }.chomp
  end

  def clear
    @pixels = Array.new(@rows) { Array.new(@columns, 'O') }
  end

  def pixel(column, row, colour)
    raise ArgumentError if row > @rows
    raise ArgumentError if column > @columns

    @pixels[row - 1][column - 1] = colour
  end

  def vertical_line(column, start_row, end_row, colour)
    raise ArgumentError if column > @columns
    raise ArgumentError if start_row > @rows
    raise ArgumentError if end_row > @rows
    raise ArgumentError if start_row > end_row

    start_row.upto(end_row) do |row|
      @pixels[row - 1][column - 1] = colour
    end
  end

  def horizontal_line(start_column, end_column, row, colour)
    raise ArgumentError if row > @rows
    raise ArgumentError if start_column > @columns
    raise ArgumentError if end_column > @columns
    raise ArgumentError if start_column > end_column

    start_column.upto(end_column) do |column|
      @pixels[row - 1][column - 1] = colour
    end
  end
end
