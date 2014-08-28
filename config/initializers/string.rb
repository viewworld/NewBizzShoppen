class String
  def db_downcase
    result = ::ActiveRecord::Base.connection.execute "select lower(#{ActiveRecord::Base.sanitize(to_s)})"
    result.first["lower"]
  end
end
