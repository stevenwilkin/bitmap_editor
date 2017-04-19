require 'command_parser'
require 'bitmap'
require 'null_bitmap'

class BitmapEditor
  attr_accessor :bitmap

  def initialize
    @bitmap = NullBitmap.new
  end

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      command, *args = CommandParser.parse(line.chomp)

      case command
        when :initialise
          @bitmap = Bitmap.new(*args)
        when :render
          puts @bitmap.render
        else
          @bitmap.public_send(command, *args)
      end
    end
  end
end
