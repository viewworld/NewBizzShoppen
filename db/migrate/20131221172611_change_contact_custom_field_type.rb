class ChangeContactCustomFieldType < ActiveRecord::Migration
  TABLE_NAMES = [
      :leads,
      :newsletter_list_subscribers,
      :users
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
        change_column table_name, column_name, :text
      end
    end
  end

  def self.down
    TABLE_NAMES.each do |table_name|
      CUSTOM_COLUMN_NAMES.each do |column_name|
        change_column table_name, column_name, :string
      end
    end
  end
end
