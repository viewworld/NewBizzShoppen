class String
  def db_downcase
    result = ::ActiveRecord::Base.connection.execute "select lower(#{ActiveRecord::Base.sanitize(self.to_s)})"
    result.first["lower"]
  end
end
