class CommandParser
  def self.parse(input)
    case input
      when 'C'
        return :clear
      when 'S'
        return :render
      when /I (\d+) (\d+)/
        return :initialise, $1.to_i, $2.to_i
      when /L (\d+) (\d+) ([A-Z])/
        return :pixel, $1.to_i, $2.to_i, $3
      when /V (\d+) (\d+) (\d+) ([A-Z])/
        return :vertical_line, $1.to_i, $2.to_i, $3.to_i, $4
      when /H (\d+) (\d+) (\d+) ([A-Z])/
        return :horizontal_line, $1.to_i, $2.to_i, $3.to_i, $4
    end

    raise StandardError, 'unrecognised command :('
  end
end
