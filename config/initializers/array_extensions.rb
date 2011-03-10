class Array
  def except(param)
    dup.except!(param)
  end

  def except!(param)
    self.delete_if{|e| Array(param).include?(e)}
  end
end