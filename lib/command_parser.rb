class CommandParser
  def self.parse(input)
    case input
      when 'C'
        return :clear
    end

    raise StandardError, 'unrecognised command :('
  end
end
