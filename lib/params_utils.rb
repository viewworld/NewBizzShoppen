class ParamsUtils

  def self.boolean?(param)
    !!ActiveRecord::ConnectionAdapters::Column.value_to_boolean(param)
  end

  def self.split_by_commas(param)
    param.to_s.gsub(/^,/, "").split(",")
  end

end
