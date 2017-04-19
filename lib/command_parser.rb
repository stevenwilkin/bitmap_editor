class CommandParser
  def self.parse(input)
    case input
      when 'C'
        return :clear
      when 'S'
        return :render
    end

    raise StandardError, 'unrecognised command :('
  end
end
