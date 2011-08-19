class Float
  def as_days
    self.to_i / 86400
  end

  def as_hours
    self.to_i / 3600
  end

  def as_minutes
    self.to_i / 60
  end

  def as_seconds
    self.to_i
  end
end