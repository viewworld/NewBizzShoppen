class CreateDynamicResultValues < ActiveRecord::Migration
  def self.up
    execute %{ DROP VIEW debtors }
    execute %{

             }
  end

  def self.down
    drop_table :dynamic_result_values
  end
end
