module Enumerable

  def group_by_multiple(arr=[])
    res = {}
    if grouper = arr.shift
      res = dup.group_by(&grouper.to_sym)
      res.each do |k,v|
        res[k] = v.group_by_multiple(arr.dup)
      end
    else
      res = self
    end
    res
  end

end