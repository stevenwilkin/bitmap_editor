class NullBitmap
  %i{clear pixel vertical_line horizontal_line}.each do |method|
    define_method(method) do |*args|
      raise StandardError, "'#{method}' not supported"
    end
  end

  def render
    'There is no image'
  end
end
