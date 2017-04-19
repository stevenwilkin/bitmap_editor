class CommandParser
  def self.parse(input)
    case input
      when 'C'
        return :clear
      when 'S'
        return :render
      when /I (\d+) (\d+)/
        return :initialise, $1.to_i, $2.to_i
    end

    raise StandardError, 'unrecognised command :('
  end
end
