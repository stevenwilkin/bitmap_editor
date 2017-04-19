class CommandParser
  def self.parse(input)
    case input
      when 'C'
        return :clear
      when 'S'
        return :render
      when /I (\d+) (\d+)/
        return :initialise, natural!($1), natural!($2)
      when /L (\d+) (\d+) ([A-Z])/
        return :pixel, natural!($1), natural!($2), $3
      when /V (\d+) (\d+) (\d+) ([A-Z])/
        return :vertical_line, natural!($1), natural!($2), natural!($3), $4
      when /H (\d+) (\d+) (\d+) ([A-Z])/
        return :horizontal_line, natural!($1), natural!($2), natural!($3), $4
    end

    raise StandardError, 'unrecognised command :('
  end

  private

  def self.natural!(n)
    raise StandardError, 'coordinates must be non-zero' unless n.to_i > 0
    n.to_i
  end
end
