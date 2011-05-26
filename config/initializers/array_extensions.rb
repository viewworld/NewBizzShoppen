class Array
  def except(param)
    dup.except!(param)
  end

  def except!(param)
    self.delete_if{|e| Array(param).include?(e)}
  end

  def chunk(pieces)
    return [] if pieces.zero?
    piece_size = (length.to_f / pieces).ceil
    [first(piece_size), *last(length - piece_size).chunk(pieces - 1)]
  end
end