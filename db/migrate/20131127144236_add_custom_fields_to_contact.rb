class AddCustomFieldsToContact < ActiveRecord::Migration

  TABLE_NAMES = [
    :leads,
    :newsletter_list_subscribers
  ]

  CUSTOM_COLUMN_NAMES = [
    :pnumber,
    :nnmid,
    :custom_1,
    :custom_2,
    :custom_3,
    :custom_4,
    :custom_5
  ]

  def self.up
    TABLE_NAMES.each do |table_name|
      CUSTOM_COLUMN_NAMES.each do |column_name|
        add_column table_name, column_name, :string
      end
    end
  end

  def self.down
    TABLE_NAMES.each do |table_name|
      CUSTOM_COLUMN_NAMES.each do |column_name|
        remove_column table_name, column_name
      end
    end
  end

end
