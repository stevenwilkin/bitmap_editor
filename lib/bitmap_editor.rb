require 'null_bitmap'

class BitmapEditor
  attr_accessor :bitmap

  def initialize
    @bitmap = NullBitmap.new
  end

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      case line
      when 'S'
          puts @bitmap.render
      else
          puts 'unrecognised command :('
      end
    end
  end
end
